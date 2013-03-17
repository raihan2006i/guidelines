class AddUserIdToGuidelines < ActiveRecord::Migration
  def change
  	add_column :guidelines, :user_id, :integer
  	add_index :guidelines, :user_id
  end
end
