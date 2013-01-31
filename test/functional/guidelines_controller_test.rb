require 'test_helper'

class GuidelinesControllerTest < ActionController::TestCase
  setup do
    @guideline = guidelines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guidelines)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:tessa)
    get :new
    assert_response :success

  end

  test "should create guideline" do
    assert_difference('Guideline.count') do
      post :create, guideline: { content: @guideline.content, hospital: @guideline.hospital, title: @guideline.title }
    end

    assert_redirected_to guideline_path(assigns(:guideline))
  end

  test "should show guideline" do
    get :show, id: @guideline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guideline
    assert_response :success
  end

  test "should update guideline" do
    put :update, id: @guideline, guideline: { content: @guideline.content, hospital: @guideline.hospital, title: @guideline.title }
    assert_redirected_to guideline_path(assigns(:guideline))
  end

  test "should destroy guideline" do
    assert_difference('Guideline.count', -1) do
      delete :destroy, id: @guideline
    end

    assert_redirected_to guidelines_path
  end
end
