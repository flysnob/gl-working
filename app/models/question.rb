# represents a single question
class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :version
  has_many :version_nodes

  def has_contents?
    help.present? || examples.present? || faq.present? || asc.present?
  end
end
