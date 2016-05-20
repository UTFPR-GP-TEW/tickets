require 'test_helper'

class Api::TicketsControllerTest < ActionController::TestCase
=begin
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_equal 200, response.status
    refute_empty response.body
  end


  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { description: @ticket.description, title: @ticket.title, status: 'aberto', project_id: 1}
    end
    assert_equal 201, response.status
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_equal 200, response.status

    ticket_response = json(response.body)
    assert_equal ticket.name, ticket_response[:title]
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { description: @ticket.description, title: 'Update Ticket', status: 'aberto', project_id: 1}
    assert_equal 'Update Ticket', Ticket.find(@ticket.id).title
    assert_equal 200, response.status
  end


  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end
    assert_equal 204, response.status
  end
=end

end
