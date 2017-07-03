# frozen_string_literal: true

# A boolean answer on an inspection
class BooleanAnswer < ApplicationRecord
  has_one(:entry, as: :answer)

  def to_s
    answer
  end
end
