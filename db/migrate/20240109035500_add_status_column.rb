class AddStatusColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :status, :string, default: 'Player'
  end
end
