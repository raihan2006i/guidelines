class AddUpdatedColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :updated_by, :integer
    add_index :guidelines, :updated_by
  end
end