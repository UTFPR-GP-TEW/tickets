require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index logged in" do
  	sign_in users(:User1)
    get :index
    assert_response :success
  end

  test "should get sign_in if not authenticated" do
  	get :index
  	assert_redirected_to new_user_session_path
  end

end
