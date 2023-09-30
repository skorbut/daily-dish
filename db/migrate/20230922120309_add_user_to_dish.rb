# frozen_string_literal: true

class AddUserToDish < ActiveRecord::Migration[7.0]
  def change
    add_reference :dishes, :user, null: true, foreign_key: true
  end
end
