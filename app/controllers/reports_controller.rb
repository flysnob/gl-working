# Responsible for controlling all the reports in the app
class ReportsController < ApplicationController
  def project
    @project = Project.find(params[:id])
    @description = "#{@project.name}" << (@project.description.present? ? @project.description : '')
    @nodes = Node.where(project: @project).where.not(index: nil).order(:index)
    recommendation_node = Node.where(project: @project).order(:index).map { |node| node if node.index.present? && node.kind == 'r' }.compact.first
    @recommendation = recommendation_node.question.report_content if recommendation_node

    respond_to do |format|
      format.html do
        render template: '/reports/project',
               layout: nil
      end
      format.pdf do
        render layout: 'report',
               pdf: "GAAP Logic Project Report #{@project.id}",
               page_size: 'Letter',
               margin: { top: 15, bottom: 15, left: 15, right: 15 }
      end
    end
  end
end
