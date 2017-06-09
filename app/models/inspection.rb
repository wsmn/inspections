class Inspection < ApplicationRecord
  belongs_to(:customer)
  has_many(:inspection_questions)
  has_many(:questions, through: :inspection_questions)
end
