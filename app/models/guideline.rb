class Guideline < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model){controller && controller.current_user}


	def to_param
		"#{id} #{title}".parameterize
	end

  attr_accessible :content, :hospital, :title, :user_id, :guideline_id, :specialty, :updated_by, :current_user, :subtitle, :slug, :activities, :country
 
 belongs_to :user
 has_many :favourite_guidelines
 has_many :comments, :dependent => :destroy


  validates :content, presence: true,
            length: {minimum:2}


  validates :title, presence: true,
            length: {minimum:2}

  validates :country, presence: true,
            length: {minimum:2}

  validates :hospital, presence: true,
            length: {minimum:2}

validates_uniqueness_of :hospital, :scope => :title, :case_sensitive => false, :message => "There is already a guideline by this title for this hospital"

validates :user_id, presence: true

searchable do
  text :title
end

 before_save do |guideline|
      guideline.content = "http://#{content}" unless guideline.content=~/^https?:\/\//
  end 

end
