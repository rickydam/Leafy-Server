# frozen_string_literal: true

# Users are for authentication and referencing data
class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
