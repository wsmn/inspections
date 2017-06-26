# frozen_string_literal: true

# Controller for handling projects
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
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


  private

  def project_params
    params.require(:project).permit(:title, :customer_id, :description)
  end
end
