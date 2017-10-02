class VersionNode < ActiveRecord::Base
  belongs_to :version
  belongs_to :question
end
