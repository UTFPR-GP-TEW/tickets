require 'test_helper'

class Api::V1::ConversationsControllerTest < ActionController::TestCase
  setup do
    @conversation = conversations(:one)
  end

  test "should get index" do
    get :index
    assert_equal 200, response.status
    refute_empty response.body
  end


  test "should create conversation" do
    assert_difference('Conversation.count') do
      post :create, conversation: { content: "TEST CREATE CONVESATION", ticket_id: 1}
    end
    assert_equal 201, response.status
  end

  test "should not create conversation" do
    post :create, conversation: { content: "", ticket_id: nil}
    assert_equal 422, response.status
  end

  test "should show conversation" do
    get :show, id: @conversation.id
    assert_equal 200, response.status

    ticket_response = JSON(response.body)
    assert_equal @conversation.content, ticket_response["content"]
  end

  test "should update conversation" do
    patch :update, id: @conversation, conversation: { content: 'Update Conversation Teste', ticket_id: 1}
    assert_equal 'Update Conversation Teste', Conversation.find(@conversation.id).content
    assert_equal 200, response.status
  end

  test "should not update conversation" do
    patch :update, id: @conversation, conversation: { content: "", ticket_id: nil}
    assert_equal 422, response.status
  end

  test "should destroy conversation" do
    assert_difference('Conversation.count', -1) do
      delete :destroy, id: @conversation
    end
    assert_equal 204, response.status
  end

end
