class Question < ApplicationRecord
  has_many(:inspection_questions)
  has_many(:inspections, through: :inspection_questions)
  enum(kind: { text: 0 })
  enum(category: { general: 0 })

  validates(:content, presence: true)
end
