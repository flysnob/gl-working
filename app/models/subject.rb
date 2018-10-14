class Subject < ActiveRecord::Base
  enum status: %i[dev beta prod retired]

  has_many :projects
  has_many :questions
  belongs_to :versions
end
