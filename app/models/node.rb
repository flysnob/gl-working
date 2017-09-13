# represents a single project node
class Node < ActiveRecord::Base
  belongs_to :project
  belongs_to :question
  has_one :response

  def pass?
    response_value != fail_response
  end
  
  def fail?
    response_value == fail_response
  end
end
