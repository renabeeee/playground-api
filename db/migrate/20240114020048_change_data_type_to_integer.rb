class ChangeDataTypeToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :player_limit, :integer, using: 'player_limit::integer'
  end
end
