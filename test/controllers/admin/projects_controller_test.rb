require 'test_helper'

class Admin::ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:Project_1)
    sign_in users(:User1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { description: 'Description Project Created', name: 'Project TEST', parent_project_id: nil, token: SecureRandom.uuid, user_id: 1 }
    end

    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should not create project" do
    post :create, project: { description: '', name: '', user_id: 1 }
    assert_template :new
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { name: 'Project Changed' }
    assert_equal 'Project Changed', Project.find(@project.id).name
    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should not update project" do
    patch :update, id: @project, project: { name: '' }
    assert_template :edit
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to admin_projects_path
  end
end
