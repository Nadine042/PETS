class AddProfilePictureToUsersAndPets < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_url, :string
    add_column :pets, :picture_url, :string
  end
end
