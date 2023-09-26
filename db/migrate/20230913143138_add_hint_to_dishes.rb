# frozen_string_literal: true

class AddHintToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :hint, :text
  end
end
