# frozen_string_literal: true

# Project containing all information regarding customer and inspections
class Project < ApplicationRecord
  belongs_to(:customer)
  has_many(:inspections)
  has_many(:images)
  enum(status: { active: 0, paused: 1, completed: 2, cancelled: 3 })

  scope(:text_search, lambda do |str|
    joins(:customer).fuzzy_search({ title: str,
                                    customers: { name: str, address: str } },
                                  false)
  end)

  def self.searchable_columns
    %i[title]
  end

  def to_s
    "#{id} - #{title}"
  end
end
