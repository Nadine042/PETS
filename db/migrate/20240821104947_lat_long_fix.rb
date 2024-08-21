class LatLongFix < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :latitude
    remove_column :pets, :longitude
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
