require 'test_helper'

class Admin::TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
    sign_in users(:User1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { description: @ticket.description, title: @ticket.title, status: 'aberto', project_id: 1}
    end

    assert_redirected_to admin_ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { description: @ticket.description, title: 'Update Ticket', status: 'aberto', project_id: 1}
    assert_equal 'Update Ticket', Ticket.find(@ticket.id).title
    assert_redirected_to admin_ticket_path(assigns(:ticket))
  end


  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end
    assert_redirected_to admin_tickets_path
  end

end
