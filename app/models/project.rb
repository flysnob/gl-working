# represents a single project
class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :version
  has_many :nodes, dependent: :destroy
  has_many :responses

  accepts_nested_attributes_for :nodes, allow_destroy: true
  accepts_nested_attributes_for :responses, allow_destroy: true
end
