# frozen_string_literal: true

# Migration to create the users table with columns for authentication using bcrypt
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
