class RemoveCommentsFromGuidelines < ActiveRecord::Migration
  def up
    remove_index :guidelines, :comments
    remove_column :guidelines, :comments
  end

  def down
    add_column :guidelines, :comments, :string
    add_index :guidelines, :comments
  end
end
