class ResponseProcessor
  class << self
    def perform(responses, project_questions)
      @responses = responses
      @last_response = @responses.last
      @project_questions = project_questions
      next_question = get_next_question

      next_question
    end

    # The next question is either the response direct target when kind is 'q',
    # the response's question when kind is 'r' and there is no return value,
    # the return node when kind is 'r' and there is a return value,
    # or the result of a decision evaluation whn kind is 'd'
    def get_next_question
      next_question = if @last_response.kind == 'q'
                        @project_questions.select { |q| q[:question_code] == @last_response.target_node }.first
                      elsif @last_response.kind == 'r' && @last_response.return_node.nil?
                        @last_response.question
                      elsif @last_response.kind == 'r' && @last_response.return_node.present?
                        @project_questions.select { |q| q[:question_code] == @last_response.return_node }.first
                      else
                        evaluate_decision
                      end
    end

    def evaluate_decision
      pass = true

      # Get all responses related to decision
      decision_responses = @responses.select { |r| r[:decision_node] == @responses.last.target_node }

      # Loop over the questions and evaluate based on boolean value while pass is true
      decision_responses.each do |r|
        case r.boolean
          # 
          when 'or'
            if pass && r.response_value == fail_value
              pass = false
              break
            end
          #
          when 'and'
            if pass

            end

          # default to or
          else
            if

            end
        end
      end
    end
  end
end
