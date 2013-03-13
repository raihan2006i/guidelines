class AddCountryColumnToGuidelines < ActiveRecord::Migration
  def change
    add_column :guidelines, :country, :string
  end
end
