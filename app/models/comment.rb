class Comment < ActiveRecord::Base
  belongs_to :guideline
  belongs_to :commenter, class_name: 'User'

  
  attr_accessible :body, :commenter_id

 end
