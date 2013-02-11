class Guideline < ActiveRecord::Base
  attr_accessible :content, :hospital, :title, :subtitle, :user_id
  belongs_to :user

 

  validates :content, presence: true,
            length: {minimum:2}


  validates :title, presence: true,
            length: {minimum:2}



  validates :hospital, presence: true,
            length: {minimum:2}

validates_uniqueness_of :title, :scope => :hospital, :case_sensitive => false, :message => "There is already a guideline by this title for this hospital"

validates :user_id, presence: true


end
