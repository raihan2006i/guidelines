class Comment < ActiveRecord::Base
	
	include PublicActivity::Model
  tracked owner: ->(controller, model){controller && controller.current_user}

  belongs_to :guideline
  belongs_to :commenter, class_name: 'User'

  
  attr_accessible :body, :commenter_id

 end
