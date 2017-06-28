class Customer < ApplicationRecord
  validates(:name, :phone, :address, :email, presence: true)

  def to_s
    name
  end
end
