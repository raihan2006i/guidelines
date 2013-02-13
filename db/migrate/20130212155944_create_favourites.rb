class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.string :user
      t.string :guideline

      t.timestamps
    end
  end
end
