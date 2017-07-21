# frozen_string_literal: true

# Controller to handle CRUD-actions for customers
class CustomersController < ApplicationController
  before_action(:require_login)
  def index
    @customers = Customer.order(created_at: :desc)
  end

  def destroy
    Customer.find(params[:id]).destroy!
    redirect_to(customers_path, notice: t('.success'))
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to(customer_path(@customer), notice: t('.success'))
    else
      render(:new, status: 422)
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to(customer_path(@customer), notice: t('.success'))
    else
      render(:edit, status: 422)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :email)
  end
end
