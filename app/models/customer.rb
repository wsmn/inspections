# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many(:projects)
  validates(:name, :phone, :address, :email, presence: true)

  scope(:text_search, lambda do |str|
    fuzzy_search({ name: str, phone: str, address: str, email: str }, false)
  end)

  def self.searchable_columns
    %i[name phone address]
  end

  def to_s
    name
  end
end
