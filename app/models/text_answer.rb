# frozen_string_literal: true

# Text answer to an inspection
class TextAnswer < ApplicationRecord
  has_one(:entry, as: :answer)

  def to_s
    answer
  end
end
