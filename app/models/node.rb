# represents a single project node
class Node < ActiveRecord::Base
  belongs_to :project
  belongs_to :question
  has_one :response

  def pass?
    response_value == meets_response
  end
  
  def fail?
    response_value != meets_response
  end
end
