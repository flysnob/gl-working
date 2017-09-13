class ResponseProcessor
  class << self
    def perform(last_node, nodes, return_node_code)
      make_logger
      @last_node = last_node
      @nodes = nodes
      @responses = Node.where(project_id: @last_node.project_id)
                       .where('response_value IS NOT NULL')
      @return_node_code = return_node_code
      @logger.info("@responses: #{@responses}")
      @logger.info("@responses.length: #{@responses.length}")
      @logger.info("@last_node: #{@last_node}")
      @logger.info("@last_node.content: #{@last_node.content}")
      @logger.info("@nodes: #{@nodes}")
      @logger.info("@nodes.length: #{@nodes.length}")
      @logger.info("@return_node_code: #{@return_node_code}")
      next_node = get_next_node
      @logger.info("next_node: #{next_node}")
      next_node
    end

    # The next node is either: 
    # 1) the @last_node direct target when @last_node kind is 'q' or 'i' (which may be module start node),
    # 2) @return_node_code when kind is 'q' or 'd' and @last_node return_node_code value is 'return' (we're done with the module, going back now),
    # 3) N/A when @last_node kind is 'r' and @last_node return_node_code value is '' (we're done with the project),
    # 4) the result of a decision evaluation when @last_node kind is 'd'
    def get_next_node
      @logger.info("@last_node.kind: #{@last_node.kind}")
      @logger.info("@return_node_code.blank?: #{@return_node_code.blank?}")
      @logger.info("@last_node.return_node: #{@last_node.return_node}")
      if @return_node_code.blank?
        evaluate_last_node
      else
        evaluate_return_node_code
      end
    end

    def evaluate_return_node_code
      # Since @return_node_code is not blank (we're in a submodule):
      # 1) if @target_node.return_node is 'return', we're near the end of the submodule since next node is the return node,
      # 2) if @target_node.return_node is not 'return', we're still in the submodule so keep going
      if @last_node.return
        @logger.info('return')
        update_return_node # update with result of the last response
        next_node = fetch_node(@return_node.target_node)
        next_node
      else
        @target_node = fetch_node(@last_node.target_node)
        @logger.info("not return")
        next_node = evaluate_target_node_not_return
        next_node
      end
    end

    # We're at the end of the submodule, so make response_hash, update @return_node, get next_node
    def evaluate_target_node_return
      @logger.info("@last_node.kind: #{@last_node.kind}")
      if @last_node.kind == 'q'
        # nothing special, so make next_node = target_node
        next_node = fetch_node(@last_node.target_node)
        next_node
      elsif @last_node.kind == 'd'
        evaluate_decision_node # makes @response_hash
        update_return_node # update with result of the last response
        next_node = fetch_node(@return_node.target_node)
        next_node
      end
    end

    def update_return_node
      # fetch the return node and update response_value and target_node based upon pass/fail result
      @return_node = fetch_node(@last_node.return_node)

      if @last_node.pass?
        #fail
        @return_node.response_value = @return_node.response_1
        @return_node.target_node = @return_node.target_1
      else
        #pass
        @return_node.response_value = @return_node.response_2
        @return_node.target_node = @return_node.target_2
      end
      @return_node.save
    end
    
    # We're still in the submodule
    def evaluate_target_node_not_return
      if @last_node.kind == 'd'
        evaluate_decision_node # makes @response_hash
      end
      next_node = fetch_node(@last_node.target_node)
      next_node.return_node = @return_node_code
      next_node
    end

    def evaluate_last_node
      # Run if @return_value is blank or not 'return' (we're in the main subject module or a submodule)
      # 1) if 'q' or 'i', next node is @last_node target node,
      # 3) if 'd', evaluate the decision,
      # 2) if 'r', na (we're done)
      if @last_node.kind == 'q' || @last_node.kind == 'i'
        @logger.info('q or i')
        @logger.info("target_node: #{@last_node.target_node}")
        next_node = @nodes.select { |q| q[:question_code] == @last_node.target_node }.first
        next_node
      elsif @last_node.kind == 'd'
        # What is the result of the decision node?
        evaluate_decision_node
        # fetch the next node with the decision target_node
        next_node = @nodes.select { |q| q[:question_code] == @response_hash[:target_node] }.first
        next_node
      end
    end


    def fetch_node(node_code)
      node = @nodes.select { |q| q[:question_code] == node_code }.first
      node
    end

    def evaluate_decision_node
      @logger.info("evaluate decision node")
      @logger.info("@target_node.question_code: #{@last_node.question_code}")
      # Get all responses related to decision
      decision_responses = @responses.select { |r| r[:decision_node] == @last_node.question_code }

      # Set pass to 1 at loop start
      pass = 1

      # Loop over the responses and evaluate based on boolean value
      decision_responses.each do |r|
        @logger.info("r: #{r}")
        case r.boolean
          # Test 'or' only if pass is still 1 (i.e., not false). Any false response will force fail (i.e., pass == false) so only value for pass will be 1 (start value) or false (fail).
          # Therefore, any fail? results in false (i.e., pass == false)
        when 'or'
          if pass == 1 && r.fail?
            pass = false
          end
        
        # Test 'and' only if pass is still 1 (i.e., not true) or false. Must fail all nodes, so any true (pass?) means the entire decision is true (i.e., pass == true)
        when 'and'
          if (pass == 1 || !pass) && r.pass?
            pass = true
          end
        end
      end

      # 1 and true are both truthy
      @logger.info("pass: #{pass}")
      if pass || pass == 1
        make_response_hash(@last_node.response_1, @last_node.target_1, 1)
      else
        make_response_hash(@last_node.response_2, @last_node.target_2, 2)
      end
        
      update_decision_node
    end

    def make_response_hash(text, target, value)
      @response_hash = {
        response_value: value,
        response_text: text,
        target_node: target
      }
    end

    def update_decision_node
      @last_node.response_value = @response_hash[:response_value]
      @last_node.target_node = @response_hash[:target_node]
      @last_node.response_text = @response_hash[:response_text]
      @last_node.return_node = @last_node.return_node unless @last_node.return
      @last_node.save
    end

    def make_logger
      @logger = Logger.new('log/response_processor.log')
    end
  end
end
