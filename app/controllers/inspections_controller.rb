class InspectionsController < ApplicationController
  def index
  end

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.new(inspection_params)
    @inspection.save

    render(:new, status: 422)
  end

  private

  def inspection_params
    params.require(:inspection).permit(:customer_id, :on)
  end
end
