class Guideline < ActiveRecord::Base

	def to_param
		"#{id} #{title}".parameterize
	end

  attr_accessible :content, :hospital, :title, :user_id, :guideline_id, :specialty

 belongs_to :user
 has_many :favourite_guidelines


  validates :content, presence: true,
            length: {minimum:2}


  validates :title, presence: true,
            length: {minimum:2}



  validates :hospital, presence: true,
            length: {minimum:2}

validates_uniqueness_of :hospital, :scope => :title, :case_sensitive => false, :message => "There is already a guideline by this title for this hospital"

validates :user_id, presence: true

searchable do
  text :title
end

end
