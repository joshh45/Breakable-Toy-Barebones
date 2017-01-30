class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_locations do |t|
      t.belongs_to :user
      t.belongs_to :location
    end
  end
end
