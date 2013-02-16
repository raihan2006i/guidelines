class CreateFavouriteGuidelines < ActiveRecord::Migration
  def change
    create_table :favourite_guidelines do |t|
      t.integer :user_id
      t.integer :guideline_id

      t.timestamps
    end
  end
end
