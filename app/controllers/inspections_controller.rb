# frozen_string_literal: true

# Handles inspections and their questions
class InspectionsController < ApplicationController
  before_action(:require_login)

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

  def show
    @project = Project.find(params[:project_id])
    @inspection = @project.inspections.find(params[:id])
    @entries = @inspection.entries
                          .includes(:question, :answer)
                          .order(:id)
    @entry = @inspection.entries.build
  end

  def create
    @project = Project.find(params[:project_id])
    @inspection = @project.inspections.build(inspection_params)
    if @inspection.save
      redirect_to(project_inspection_path(@project, @inspection),
                  notice: t('.success'))
    else
      render(:new, status: 422)
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    project.inspections.find(params[:id]).destroy!

    redirect_to(project_inspections_path(project), notice: t('.success'))
  end

  private

  def inspection_params
    params.require(:inspection).permit(:at_date)
  end
end
