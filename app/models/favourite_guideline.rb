class FavouriteGuideline < ActiveRecord::Base
  attr_accessible :guideline_id, :user_id
  belongs_to :guideline
  belongs_to :user
end
