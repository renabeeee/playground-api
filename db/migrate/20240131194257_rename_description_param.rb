class RenameDescriptionParam < ActiveRecord::Migration[7.1]
  def change
    rename_column :games, :description, :title
  end
end
