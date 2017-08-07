# represents a single response
class Response < ActiveRecord::Base
  belongs_to :project_questions
  belongs_to :projects
end
