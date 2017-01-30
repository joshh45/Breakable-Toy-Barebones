class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :rating, null: false
      t.string :cover_url, null: false
      t.string :address, null: false
      t.string :rating_img
      t.string :url 
    end
  end
end
