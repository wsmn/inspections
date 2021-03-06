# frozen_string_literal: true

FactoryBot.define do
  factory(:entry) do
    inspection
    question

    trait(:boolean_answer) do
      answer { boolean_answer }
    end

    trait(:text_answer) do
      answer { boolean_answer }
    end
  end
end
