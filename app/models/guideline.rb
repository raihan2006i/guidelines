class Guideline < ActiveRecord::Base
  attr_accessible :content, :hospital, :title, :subtitle, :user_id, :guideline_id

 belongs_to :user
 has_many :favourite_recipes
 has_many :favourited_by, source: :guideline, through: :favourite_recipes, source: :user

 

  validates :content, presence: true,
            length: {minimum:2}


  validates :title, presence: true,
            length: {minimum:2}



  validates :hospital, presence: true,
            length: {minimum:2}

validates_uniqueness_of :title, :scope => :hospital, :case_sensitive => false, :message => "There is already a guideline by this title for this hospital"

validates :user_id, presence: true


end
