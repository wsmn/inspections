# frozen_string_literal: true

# Connects and inspection, a question and an answer.
class Entry < ApplicationRecord
  attr_accessor(:kind, :question_string)
  belongs_to(:inspection)
  belongs_to(:question)
  belongs_to(:answer, polymorphic: true, optional: true)

  def to_s
    "#{id}: #{question.question}"
  end

  def build_answer(args = {})
    self.answer ||= new_answer(args)
  end

  def answer_form
    # "/answers/#{question.kind}_form"
    "/answers/form"
  end

  private

  def new_answer(args)
    case question.kind
    when 'text'
      TextAnswer.new(args)
    when 'bool'
      BooleanAnswer.new(args)
    end
  end
end
