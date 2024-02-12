class ChangeImageToUrl < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :image_url, :string
  end
end
