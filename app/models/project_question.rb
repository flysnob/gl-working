# represents a single project
class ProjectQuestion < ActiveRecord::Base
  belongs_to :project
  belongs_to :question
  has_one :response
end
