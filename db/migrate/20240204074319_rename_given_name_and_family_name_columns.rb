class RenameGivenNameAndFamilyNameColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :givenName, :given_name
    rename_column :users, :familyName, :family_name
  end
end
