class AddsUserIdColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :user_id, :integer
    add_column :usernames, :user_id, :integer
  end
end
