class Guideline < ActiveRecord::Base
  attr_accessible :content, :hospital, :title, :user_id
  belongs_to :user
  belongs_to :hospital_id

end
