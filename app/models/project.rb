# represents a single project
class Project < ActiveRecord::Base
  belongs_to :user
  # has_one :subject
  # has_one :version
  # has_many :questions
  # has_many :responses
end
