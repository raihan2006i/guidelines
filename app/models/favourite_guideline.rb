class FavouriteGuideline < ActiveRecord::Base
  attr_accessible :guideline_id, :user_id

  belongs_to :user
  belongs_to :guideline
end	
