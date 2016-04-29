require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "should create user" do
		assert_difference('User.count', 1) do
			User.create :email=> "name@example.com", :password => "12345678", :password_confirmation => "12345678"
		end
	end
end
