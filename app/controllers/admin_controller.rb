class AdminController < ApplicationController	

	def after_sign_in_path_for(resource)
	 admin_dashboard
	end
end
