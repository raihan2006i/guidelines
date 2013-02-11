class AddSubtitleToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :subtitle, :string
    add_index :guidelines, :subtitle
  end
end
