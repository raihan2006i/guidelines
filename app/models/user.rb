class User < ActiveRecord::Base

include PublicActivity::Model
  tracked owner: ->(controller, model){controller && controller.current_user}
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :profile_name, :base_hospital, :email, :password, :password_confirmation, :remember_me, :commenter_id
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

 has_many :guidelines, :autosave => true
 has_many :favourite_guidelines
 has_many :comments




 

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
