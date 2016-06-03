require 'test_helper'

class Admin::HomeControllerTest < ActionController::TestCase

  test "should get index not logged" do
    get :index
    assert_response 302
  end

  test "should get index logged" do
    sign_in users(:User1)
    get :index
    assert_response :success
  end


end
