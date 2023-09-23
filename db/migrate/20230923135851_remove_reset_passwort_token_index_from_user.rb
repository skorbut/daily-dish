class RemoveResetPasswortTokenIndexFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :reset_password_token
  end
end
