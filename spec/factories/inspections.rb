# frozen_string_literal: true

FactoryBot.define do
  factory(:inspection) do
    project
    at_date { rand(6).days.from_now }
  end
end
