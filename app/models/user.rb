# represents a single user
class User < ActiveRecord::Base
  has_one :setting
  has_many :projects

  enum role: %i[user vip admin]
  after_initialize :set_default_role, if: :new_record?
  after_initialize :set_setting, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def set_setting
    self.setting = Setting.create
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
