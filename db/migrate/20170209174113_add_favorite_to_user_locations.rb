class AddFavoriteToUserLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_locations, :favorite, :boolean, default: false
  end
end
