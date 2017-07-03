# frozen_string_literal: true

FactoryGirl.define do
  factory :question do
    question 'Vad är ...?'
    kind { Question.kinds.keys.sample }
    description
  end
end
