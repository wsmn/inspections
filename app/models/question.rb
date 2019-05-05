# frozen_string_literal: true

# Questions used for inspections
class Question < ApplicationRecord
  has_many(:entries)
  has_many(:inspections, through: :entries)
  enum(kind: {text: 0, bool: 1})

  validates(:question, :kind, presence: true)
  validates(:question, uniqueness: {scope: :kind})

  def to_s
    "#{id}/#{kind}: #{question}"
  end
end
