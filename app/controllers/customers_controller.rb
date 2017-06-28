# Controller to handle CRUD-actions for customers
class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render(json: @customer)
    else
      render(json: @customer.errors, status: :unprocessable_entity)
    end
  end

  def edit
  end

  # def destroy
  #   respond_with(Customer.destroy(params[:id]))
  # end
  #
  # def update
  #   customer = Customer.find(params[:id])
  #   customer.update(customer)
  #   respond_with(customer, json: customer)
  # end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :email)
  end
end
