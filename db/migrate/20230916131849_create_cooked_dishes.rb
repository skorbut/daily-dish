# frozen_string_literal: true

class CreateCookedDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :cooked_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.date :cooked_at

      t.timestamps
    end
  end
end
