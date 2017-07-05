# frozen_string_literal: true

class SearchesController < ApplicationController
  def project
    @projects = Project.includes(:customer)
                       .text_search(search_param)
  end

  private

  def search_param
    params.require(:search).fetch(:text, '')
  end
end
