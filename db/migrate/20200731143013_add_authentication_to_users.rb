# frozen_string_literal: true

# Add required columns for bcrypt
class AddAuthenticationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
  end
end
