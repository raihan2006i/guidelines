class AddNameColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :name, :string
  end
end
