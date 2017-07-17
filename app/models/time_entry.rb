# frozen_string_literal: true

# Questions used for inspections
class TimeEntry < ApplicationRecord
  has_many(:projects)

  def to_s
    "#{title}"
  end
end
