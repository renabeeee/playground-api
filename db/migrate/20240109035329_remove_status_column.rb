class RemoveStatusColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :status, :string
  end
end
