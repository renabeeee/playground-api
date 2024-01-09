class RemovePronounsColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :pronouns, :array
  end
end
