class DropUsernameTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :usernames
  end
end
