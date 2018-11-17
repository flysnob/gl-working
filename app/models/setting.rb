# represents a single user setting
class Setting < ActiveRecord::Base
  belongs_to :user

  def pause_at_conclusion?
    conclusion_pause
  end

  def skip_conclusion?
    !conclusion_pause
  end
end
