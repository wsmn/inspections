class Inspection < ApplicationRecord
  belongs_to(:project)
  has_one(:customer, through: :project)

  validates(:on, presence: true)

  scope(:by_date, -> { order(:on) })
end
