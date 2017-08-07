class Subject < ActiveRecord::Base
  has_many :projects
  has_many :questions
  belongs_to :versions
end
