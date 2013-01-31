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
                with: /a-zA-Z0-9_-/,
                message: 'Must be formatted correctly.'
              }
  validates :base_hospital, presence:true

 has_many :guidelines

 def full_name
 	first_name + " " + last_name
 end
end
