# frozen_string_literal: true

# Creates users for testing
FactoryGirl.define do
  factory(:user) do
    email
    password 'passpass'
    role { User.roles.keys.sample }
    name
  end
end
