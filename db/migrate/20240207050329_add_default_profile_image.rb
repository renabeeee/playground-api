class AddDefaultProfileImage < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :profile_image, default: "https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2281862025.jpg"
  end
end
