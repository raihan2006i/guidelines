class CommentsController < ApplicationController
  before_filter :authenticate_user!
	
	def create
			@guideline = Guideline.find(params[:guideline_id])
			@comment = @guideline.comments.build params[:comment].merge(commenter_id: current_user.id)
			@comment.save	
			redirect_to guideline_path(@guideline)
	end

	def destroy
	    @guideline = Guideline.find(params[:guideline_id])
	    @comment = @guideline.comments.find(params[:id])
	    @comment.destroy
	    redirect_to guideline_path(@guideline)
	end

  
end
