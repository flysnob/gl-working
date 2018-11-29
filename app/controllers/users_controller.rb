# the users controller
class UsersController < ApplicationController
  layout 'modal', only: [:subscribe]

  before_action :authenticate_user!
  before_action :admin_only, except: [:show, :subscribe]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin? || @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  def subscribe
    @user = User.find(params[:user])
  end

  private

  def admin_only
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def secure_params
    params.require(:user).permit(:role, :user)
  end
end
