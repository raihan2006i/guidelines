class RemoveCommentFromGuidelines < ActiveRecord::Migration
  def up
    remove_column :guidelines, :comment
  end

  def down
    add_column :guidelines, :comment, :string
  end
end
