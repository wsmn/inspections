# frozen_string_literal: true

# Website users
class User < ApplicationRecord
  include Clearance::User
  enum(role: { user: 0, admin: 1 })
end
