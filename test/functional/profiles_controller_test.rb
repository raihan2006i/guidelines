require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tessa).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end


	test "should render a 404 on profile not found" do
	  	get :show, id: "doesan't exist"
	  	assert_response :not_found

	end

	test "that variables are assigned on show page" do 
		get :show, id: users(:tessa).profile_name
    	assert assigns (:user)
    	assert_not_empty assigns(:guidelines)

	end

	test "only shows the correct user's guidelines" do
		get :show, id: users(:tessa).profile_name
    	assigns(:guidelines).each do |guideline|
    		assert_equal users(:tessa), guideline.user
    	end
	end
end
