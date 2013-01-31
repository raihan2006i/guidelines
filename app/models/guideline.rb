class Guideline < ActiveRecord::Base
  attr_accessible :content, :hospital, :title, :user_id
  belongs_to :user
  belongs_to :hospital_id

  validates :content, presence: true,
  					length: {minimum:2}

  validates :user_id, presence: true

  validates :title, presence: true,
  					length: {minimum:2}

  validates :hospital, presence: true,
  					length: {minimum:2}

  validates_uniqueness_of :title, :scope => :hospital, :case_sensitive => false, :message => "There is already a guideline by this title for this hospital"

  



end
