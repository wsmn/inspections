class Inspection < ApplicationRecord
  belongs_to(:project)
  has_one(:customer, through: :project)
  has_many(:entries)
  has_many(:questions, through: :entries)

  validates(:at_date, presence: true)

  scope(:by_date, -> { order(:at_date) })
  scope(:upcoming, -> { by_date.where("at_date >= :time", time: Time.current) })

  def to_s
    I18n.l(at_date)
  end
end
