class FavouritesController < ApplicationController
  def show

  	@user = current_user
  	if @user 
  		@guidelines = Guideline.find_all_by_id(current_user.favourite_guidelines.map(&:guideline_id))
  		render action: :show
  	else
		render file: 'public/404', status: 404, formats: [:html]
	end
  end
end