# represents a single return record
class Return < ActiveRecord::Base
  belongs_to :project

  enum role: %i[active reload inactive]
end
