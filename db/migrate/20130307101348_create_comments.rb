class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commenter
      t.text :body
      t.references :guideline

      t.timestamps
    end
    
    add_index :comments, :guideline_id
  end
end
