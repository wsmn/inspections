# Controller to handle CRUD-actions for customers
class CustomersController < ApplicationController
  def index
    @customers = Customer.order(created_at: :desc)
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      @customers = Customer.order(created_at: :desc)
      render(:index)
    else
      render(json: { errors: @customer.errors }, status: :unprocessable_entity)
    end
  end

  def edit
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :email)
  end
end
