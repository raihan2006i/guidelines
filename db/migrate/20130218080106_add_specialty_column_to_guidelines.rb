class AddSpecialtyColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :specialty, :string
    add_index :guidelines, :specialty
  end
end
