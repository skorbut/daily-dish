# frozen_string_literal: true

class CreateFavoriteDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
