class ActivitiesController < ApplicationController
  
  def index
		@activities = PublicActivity::Activity
		.order("created_at desc")
		.where(trackable_type: %w(Guideline Comment))
	end

	
end
