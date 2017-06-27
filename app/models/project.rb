class Project < ApplicationRecord
  belongs_to(:customer)
  has_many(:inspections)
  enum(status: { active: 0, paused: 1, completed: 2, cancelled: 3 })

  def self.searchable_columns
    %i[title]
  end

  def to_s
    "#{id} - #{title}"
  end
end
