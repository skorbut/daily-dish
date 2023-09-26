# frozen_string_literal: true

class AddUserToCookedDish < ActiveRecord::Migration[7.0]
  def change
    add_reference :cooked_dishes, :user, null: true, foreign_key: true
  end
end
