# frozen_string_literal: true

# Images for projects and inspections
class Image < ApplicationRecord
  belongs_to(:project)
  validates(:description, presence: true)
  has_one_attached(:file)
end
