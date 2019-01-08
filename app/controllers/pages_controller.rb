# Controller for general site pages
class PagesController < ApplicationController
  before_action :clear_flash

  def about; end

  def index; 
    @subjects = Subject.where(status: 'prod').order(:name)
    @content = Content.find_by(title: 'Welcome')
  end

  def terms_of_use
    @content = Content.find_by(title: 'Terms of Use')
  end

  def privacy_policy
    @content = Content.find_by(title: 'Privacy Policy')
  end

  private

  def clear_flash
    flash.delete(:alert)
    flash.clear
  end

end
