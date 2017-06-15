class InspectionsController < ApplicationController
  def index
    @inspections = Inspection.by_date
  end

  def new
    @inspection = Inspection.new
  end

  def edit
    @inspection = Inspection.find(params[:id])
  end

  def create
    @inspection = Inspection.new(inspection_params)
    @inspection.save

    render(:new, status: 422)
  end

  def destroy
    inspection = Inspection.find(params[:id])
    inspection.destroy!

    redirect_to(inspections_path, notice: t('.success'))  
  end

  private

  def inspection_params
    params.require(:inspection).permit(:customer_id, :on)
  end
end
