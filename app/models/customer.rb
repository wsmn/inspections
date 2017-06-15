class Customer < ApplicationRecord
  validates(:name, :phone, :address, presence: true)

  def to_s
    name
  end
end
