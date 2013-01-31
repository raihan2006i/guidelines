require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

   test "a user should enter a base hospital name" do
  	user=User.new
  	assert !user.save
  	assert !user.errors[:base_hospital].empty?
  end

  test "a user should have a unique profile name" do
  	user=User.new
  	user.profile_name = users(:tessa).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user=User.new(first_name: "Tessa", last_name: "Davis", email: "tessadavis07@gmail.com", base_hospital: "SCH")
    user.password="password"
    user.profile_name="tessa davis"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user=User.new(first_name: "Tessa", last_name: "Davis", email: "tessadavis07@gmail.com", base_hospital: "SCH")
    user.password="password"
    user.profile_name="tessadavis"
    assert user.valid?
  end

end
