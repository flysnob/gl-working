# Notifications are in-app notifications.
class NotificationsController < ApplicationController
  def destroy
    current_user
      .mailbox
      .notifications
      .find_by(id: params[:id])
      .destroy
    flash[:notice] = 'Reminder successfully dismissed.'
    redirect_to :back
  end
end
