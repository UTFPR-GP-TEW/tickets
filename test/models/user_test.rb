require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = users(:User1)
	end

	test "should create user" do
		assert_difference('User.count', 1) do
			User.create :email=> "name@example.com", :password => "12345678", :password_confirmation => "12345678"
		end
	end

	test "should user has projects" do
		user = users(:User1)
		assert_equal(1, user.projects.count)
	end
end
