class Hospital < ActiveRecord::Base
  attr_accessible :name, :hospital_id
 has_many :guidelines
end
