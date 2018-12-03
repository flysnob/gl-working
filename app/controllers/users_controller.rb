# the users controller
class UsersController < ApplicationController
  layout 'modal', only: [:subscribe]

  skip_before_filter :verify_authenticity_token, :only => [:purchase]
  before_action :authenticate_user!, except: [:purchase]
  before_action :admin_only, except: [:show, :subscribe, :purchase]

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
    @project = Project.find(params[:id])
    @content = Content.find_by(title: 'please_pay') || ''
  end

  def purchase
    user = User.find_by(id: params[:id])
    purchase_params = params.permit!
    result = ProcessPayment.perform(user, purchase_params)
    if purchase_params[:amount] == '12500'
      user.subscription_start = Date.current
    else
      project = Project.find(purchase_params[:project])
      project.update_attributes(paid: true)
    end
    Rails.logger.error(result)

    render json: result
  end

  private

  def admin_only
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def secure_params
    params.require(:user).permit(:role, :user)
  end
end
