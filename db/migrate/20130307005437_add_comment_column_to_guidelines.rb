class AddCommentColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :comment, :string
    add_index :guidelines, :comment
  end
end