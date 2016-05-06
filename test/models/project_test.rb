require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should add the fixtures" do
    assert_not_equal 0, Project.count
  end

  test "should not project create without name" do
    assert_difference('Project.count', 0) do
      Project.create description: 'None', token: SecureRandom.uuid, parent_project_id: nil, user_id: 1
    end
  end

  test "should not duplicate token" do
    token = SecureRandom.uuid
    assert_difference('Project.count', 1) do
      Project.create name: 'None1', description: 'None1', token: token, parent_project_id: nil, user_id: 1
      Project.create name: 'None2', description: 'None2', token: token, parent_project_id: nil, user_id: 1
    end
  end
end
