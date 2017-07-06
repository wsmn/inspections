# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many(:projects)
  validates(:name, :phone, :address, :email, presence: true)

  def self.searchable_columns
    %i[name phone address]
  end

  def to_s
    name
  end
end
