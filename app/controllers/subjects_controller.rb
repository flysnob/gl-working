# Subjects are different areas of GAAP
class SubjectsController < ApplicationController
  def versions
    @versions = Version.where(subject_id: params[:id])
                       .order('effective_date DESC')

    respond_to do |format|
      format.json { render json: @versions }
    end
  end
end
