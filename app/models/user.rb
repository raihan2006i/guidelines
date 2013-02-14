class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :profile_name, :base_hospital, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :profile_name, presence:true,
  						uniqueness:true,
              format: {
                with: /^[a-zA-Z0-9_-]+$/,
                message: 'Must be formatted correctly.'
              }
  validates :base_hospital, presence:true

 has_many :guidelines
 has_many :favourites, :dependent => :destroy
 has_many :favourite_guidelines, :through => :favourites, :source => :guideline




 

 def full_name
 	first_name + " " + last_name
 end

 def gravatar_url
  stripped_email=email.strip
  downcased_email=stripped_email.downcase
  hash = Digest::MD5.hexdigest(downcased_email)
  "http://gravatar.com/avatar/#{hash}"
 end
end
