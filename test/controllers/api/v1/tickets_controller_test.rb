require 'test_helper'

class Api::V1::TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  #test "should get index" do
  #  get :index
  #  assert_equal 200, response.status
  #  refute_empty response.body
  #end

  #test "should get index with status" do
  #  get :index, status: :aberto
  #  assert_equal 200, response.status
  #  refute_empty response.body
  #end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { description: @ticket.description, title: @ticket.title, status: 'aberto', project_id: 1}
    end
    assert_equal 201, response.status
  end

  test "should not create ticket" do
    post :create, ticket: { description: "", status: 'aberto', project_id: nil}
    assert_equal 422, response.status
  end

  #test "should show ticket" do
  #  get :show, id: @ticket.id
  #  assert_equal 200, response.status

#    ticket_response = JSON(response.body)
#    assert_equal @ticket.title, ticket_response["title"]
#  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { description: @ticket.description, title: 'Update Ticket', status: 'aberto', project_id: 1}
    assert_equal 'Update Ticket', Ticket.find(@ticket.id).title
    assert_equal 200, response.status
  end

  test "should not update ticket" do
    patch :update, id: @ticket, ticket: { description: "", title: '', status: 'aberto', project_id: nil}
    assert_equal 422, response.status
  end

  test "should conversations ticket" do
    get :conversations, id: @ticket.id
    assert_equal 200, response.status

    ticket_response = JSON(response.body)
    assert_equal @ticket.conversations.size, 0
  end


  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end
    assert_equal 204, response.status
  end

end
