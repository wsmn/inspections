# frozen_string_literal: true

# Controller for handling projects
class DropboxController < ApplicationController
  before_action(:require_login)

  def entries
    render(json: { entries: Dropbox.new.entries(path) })
  end

  def link
    render(json: { link: Dropbox.new.link(path).url })
  end

  def folder
    render(json: { folder: Dropbox.new.create_folder(path) })
  end

  private

  def path
    path = params[:project].to_s
    path += "/#{params[:name]}" if params[:name].present?
    path
  end
end
