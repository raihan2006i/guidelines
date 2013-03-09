class AddVisibleColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :visible, :boolean
  end
end
