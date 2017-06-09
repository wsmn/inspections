class InspectionsController < ApplicationController
  def index
  end

  def new
    @inspection = Inspection.new
  end
end
