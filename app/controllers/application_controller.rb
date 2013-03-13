class ApplicationController < ActionController::Base



	include PublicActivity::StoreController
	  protect_from_forgery


	def after_sign_in_path_for(resource)
	 favourites_path
	end

	hide_action :current_user
   

end
