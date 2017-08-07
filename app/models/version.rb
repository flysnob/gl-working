class Version < ActiveRecord::Base
  belongs_to :subject
  has_many :questions

  scope :by_subject, ->(subject) { where('subject_id = ?', subject.id) }
end
