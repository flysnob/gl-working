class ResponseProcessor
  class << self
    def perform(last_node, nodes, return_node_code)
      @last_node = last_node
      @nodes = nodes

      # can get this from the db
      @return_node_code = return_node_code

      @returns = Return.where(project_id: @last_node.project_id)
      
      create_return if @last_node.target_module.present? && @last_node.response_value == '3' && @returns.find_by(return_node_code: @return_node_code).nil?

      @responses = Node.where(project_id: @last_node.project_id)
                       .where('response_value IS NOT NULL')

      next_node = get_next_node
      next_node
    end

    def create_return
      Return.create(
        project_id: @last_node.project_id,
        node_index: @returns.length + 1,
        question_code: @last_node.question_code,
        return_node_code: @last_node.question_code,
        status: 0
      )
      @returns = Return.where(project_id: @last_node.project_id)
    end

    ##############################################################################################################################################
    # The next node is either: 
    # 1) the @last_node direct target when @last_node kind is 'q' or 'i' (which may be module start node),
    # 2) @return_node_code when kind is 'q' or 'd' and @last_node return_node_code value is 'return' (we're done with the module, going back now),
    # 3) N/A when @last_node kind is 'r' and @last_node return_node_code value is '' (we're done with the project),
    # 4) the result of a decision evaluation when @last_node kind is 'd'
    ##############################################################################################################################################

    def get_next_node
      if @returns.length.zero?
        evaluate_last_node
      else
        evaluate_return_node_code
      end
    end

    ##############################################################################################################################################
    #
    # evaluate_last_node
    #
    # Only run if @return_node_code is blank (we're in the main subject module)
    # 1) if 'q' or 'i', next node is @last_node target node,
    # 2) if 'd', evaluate the decision,
    # 3) if 'cf' or 'cp', evaluate the conclusion,
    # 4) if 'r', na (we're done)
    ##############################################################################################################################################

    def evaluate_last_node
      if @last_node.kind == 'q' || @last_node.kind == 'i'
        next_node = @nodes.select { |q| q[:question_code] == @last_node.target_node }.first
        next_node
      elsif @last_node.kind == 'd'
        # What is the result of the decision node?
        evaluate_decision_node

        # fetch the next node with the decision target_node
        next_node = @nodes.select { |q| q[:question_code] == @response_hash[:target_node] }.first
        next_node
      elsif %w[cf cp].include?(@last_node.kind)
        # What is the result of the conclusion node?
        evaluate_conclusion_node

        # fetch the next node with the conclusion target_node
        next_node = @nodes.select { |q| q[:question_code] == @response_hash[:target_node] }.first
        next_node
      end
    end

    ##############################################################################################################################################
    #
    # evaluate_return_node_code
    #
    # Since @return_node_code is not blank (we're in a submodule):
    # 1) if @last_node.return is 'true', we're at the end of the submodule since the next node is the return node,
    # 2) if @last_node.return is not 'true', we're still in the submodule so keep going
    ##############################################################################################################################################

    def evaluate_return_node_code
      if @last_node.return
        # update with result of the last response
        update_return_node
        next_node = evaluate_target_node_return
        next_node
      else
        @target_node = fetch_node(@last_node.target_node)
        next_node = evaluate_target_node_not_return
        next_node
      end
    end

    ##############################################################################################################################################
    #
    # evaluate_target_node_return
    #
    # We're at the end of the submodule, so make response_hash, update @return_node, get next_node
    ##############################################################################################################################################

    def evaluate_target_node_return
      if @last_node.kind == 'q'
        # nothing special, so make next_node = target_node
        update_return_node
        next_node = fetch_node(@return_node.target_node)
        next_node
      elsif @last_node.kind == 'd'
        # makes @response_hash
        evaluate_decision_node

        # update with result of the last response
        update_return_node

        next_node = fetch_node(@return_node.target_node)
        next_node
      elsif %w[cf cp].include?(@last_node.kind)
        # makes @response_hash
        evaluate_conclusion_node

        # update with result of the last response
        update_return_node

        next_node = fetch_node(@return_node.target_node)
        next_node
      end
    end

    def update_return_node
      # fetch the return node and then update response_value and target_node based upon pass/fail result
      # i think this is where to get the return node from the database and then run fetch_node on that; it's the last record for this project
      # this currenctly resets the analyze response on the return node. not cool. needs to leave that alone and do something else
      @return_node = fetch_node(@returns.last.return_node_code)

      if @last_node.pass?
        #pass
        @return_node.response_value = @return_node.response_1
        @return_node.target_node = @return_node.target_1
      else
        #fail
        @return_node.response_value = @return_node.response_2
        @return_node.target_node = @return_node.target_2
      end

      @return_node.save

      # select the last active return since that's the one we're working on
      r = Return.where(status: 'active').last
      if r
        r.status = 1
        r.save
      end
    end

    ##############################################################################################################################################
    # We're still in the submodule
    ##############################################################################################################################################

    def evaluate_target_node_not_return
      # makes response hash
      if @last_node.kind == 'd'
        evaluate_decision_node
      end

      next_node = fetch_node(@last_node.target_node)

      # probably don't need to do this line since we are using a db instead of recording the return node on the node
      next_node.return_node = @return_node_code
      next_node
    end


    def fetch_node(node_code)
      node = @nodes.select { |q| q[:question_code] == node_code }.first
      node
    end

    def evaluate_decision_node
      # Get all responses related to decision
      decision_responses = @responses.select { |r| r[:decision_node] == @last_node.question_code }

      # Set meets (i.e., meets conditions or 'true') to nil (falsy) at loop start
      meets = nil

      # Loop over the responses and evaluate based on boolean value
      decision_responses.each do |r|
        case @last_node.boolean
          # Test 'or' only if meets is falsy. Any true response will force meets to be truthy. Therefore, any pass? results in meets being truthy
        when 'or'
          if !meets
          # nada
          end
          if !meets && r.pass?
            meets = true
          end
        
          # Test 'and' only if meets is truthy because you are looking for a single failure. Must pass all nodes, so any false response (fails?) means the
          # entire decision is falsy (i.e., meets == false).
          # Note: Have to test condition meets == nil even though it is falsy (versus meets == false) in case meets is still the start value, otherwise
          # meets never has the possibility of ever being truthy.
        when 'and'
          if meets == nil && r.pass?
            meets = true
          elsif meets && r.fail?
            meets = false
          end
        end
      end

      # nil and false are both falsy
      if meets
        make_response_hash(@last_node.response_1, @last_node.target_1, 1)
      else
        make_response_hash(@last_node.response_2, @last_node.target_2, 2)
      end
        
      update_decision_node
    end

    def evaluate_conclusion_node
      # always false
      if @last_node.kind == 'cp'
        make_response_hash(@last_node.response_1, @last_node.target_1, 1)
      else
        make_response_hash(@last_node.response_2, @last_node.target_2, 2)
      end
        
      update_conclusion_node
    end

    def make_response_hash(text, target, value)
      @response_hash = {
        response_text: text,
        target_node: target,
        response_value: value,
        display_value: value
      }
    end

    def update_decision_node
      @last_node.response_value = @response_hash[:response_value]
      @last_node.display_value = @response_hash[:display_value]
      @last_node.target_node = @response_hash[:target_node]
      @last_node.response_text = @response_hash[:response_text]
      @last_node.return_node = @last_node.return_node unless @last_node.return
      @last_node.save
    end

    def update_conclusion_node
      @last_node.response_value = @response_hash[:response_value]
      @last_node.display_value = @response_hash[:display_value]
      @last_node.target_node = @response_hash[:target_node]
      @last_node.response_text = @response_hash[:response_text]
      @last_node.return_node = @last_node.return_node unless @last_node.return
      @last_node.save
    end
  end
end
