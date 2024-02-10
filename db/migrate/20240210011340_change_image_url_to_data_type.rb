class ChangeImageUrlToDataType < ActiveRecord::Migration[7.1]
  def change
      change_column :games, :image_url, :binary, using: 'image_url::bytea'
  end
end
