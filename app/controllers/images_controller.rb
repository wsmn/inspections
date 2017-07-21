# frozen_string_literal: true

# Handles images for projects and inspections
class ImagesController < ApplicationController
  before_action(:require_login)

  def index
    @project = Project.find(params[:project_id])
    @images = @project.images.taken_at
  end

  def new
    @project = Project.find(params[:project_id])
    @image = @project.images.build
  end

  def edit
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @image = @project.images.build(image_params)
    if @image.save
      redirect_to(project_images_path(@project), notice: t('.success'))
    else
      render(:new, status: 422)
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])
    if @image.update(image_params)
      redirect_to(edit_project_image_path(@project, @image),
                  notice: t('.success'))
    else
      render(:edit, status: 422)
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    project.images.find(params[:id]).destroy!
    redirect_to(project_images_path(project), notice: t('.success'))
  end

  private

  def image_params
    params.require(:image).permit(:project_id, :file, :description, :taken_at)
  end
end
