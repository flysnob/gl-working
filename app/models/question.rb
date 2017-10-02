# represents a single question
class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :version
  has_many :version_nodes
end
