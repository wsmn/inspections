# frozen_string_literal: true

# View helper for questions
module QuestionHelper
  def question_kinds
    Question.kinds.keys.map { |k| [question_kind(k), k] }
  end

  def question_kind(key)
    t("models.question.kind.#{key}")
  end
end
