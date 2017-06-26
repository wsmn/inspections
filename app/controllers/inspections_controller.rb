class InspectionsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @inspections = @project.inspections.by_date
  end

  def new
    @project = Project.find(params[:project_id])
    @inspection = @project.inspections.build
  end

  def edit
    @project = Project.find(params[:project_id])
    @inspection = @project.inspections.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @inspection = @project.inspections.build(inspection_params)
    @inspection.save!

    render(:new, status: 422)
  end

  def destroy
    project = Project.find(params[:project_id])
    project.inspections.find(params[:id]).destroy!

    redirect_to(project_inspections_path(project), notice: t('.success'))
  end

  private

  def inspection_params
    params.require(:inspection).permit(:on)
  end
end
