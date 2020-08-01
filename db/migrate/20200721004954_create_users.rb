# frozen_string_literal: true

# Create a table for users
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, &:timestamps
  end
end
