class AddCommentsColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :comments, :string
    add_index :guidelines, :comments
  end
end