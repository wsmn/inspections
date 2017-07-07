# frozen_string_literal: true

# Controller for handling projects
class ProjectsController < ApplicationController
  def index
    @status = params[:status]
    @projects = Project.includes(:customer)
    @projects = @projects.where(status: @status) if @status.present?
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.includes(:customer).find(params[:id])
    @inspections = @project.inspections.upcoming
    @image = @project.images.sample
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to(project_path(@project), notice: t('.success'))
    else
      render(:new, status: 422)
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to(edit_project_path(@project), notice: t('.success'))
    else
      render(:edit, status: 422)
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :customer_id, :description, :status)
  end
end
