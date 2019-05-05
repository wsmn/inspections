# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    question { 'Vad är ...?' }
    kind { Question.kinds.keys.sample }
    description
  end
end
