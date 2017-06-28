class AddEmailToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column(:customers, :email, :string)
  end
end
