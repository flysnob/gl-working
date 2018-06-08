# Controller for general site pages
class PagesController < ApplicationController
  def index
    @live_subjects = Subject.all
  end

  def about; end
end
