class CreateGuidelines < ActiveRecord::Migration
  def change
    create_table :guidelines do |t|
      t.string :title
      t.text :content
      t.string :hospital


      t.timestamps
    end
  end
end
