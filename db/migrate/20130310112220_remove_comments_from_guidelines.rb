class RemoveCommentsFromGuidelines < ActiveRecord::Migration
  def up
    remove_column :guidelines, :comments
  end

  def down
    add_column :guidelines, :comments, :string
  end
end
