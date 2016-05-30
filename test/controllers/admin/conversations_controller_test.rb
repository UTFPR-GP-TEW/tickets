require 'test_helper'

class Admin::ConversationsControllerTest < ActionController::TestCase
  setup do
    @conversation = conversations :one
    sign_in users(:User1)
  end

  test "should destroy conversation" do
    assert_difference('Conversation.count', -1) do
      delete :destroy, id: @conversation
    end
  end

  test "should add conversation" do
    @ticket = tickets :one

    assert_difference('Conversation.count', 1) do

      # Simulate a POST response with the given HTTP parameters.
      post :create, conversation: { content: 'I Love Hina. You Love Hina. We loves Hine.', ticket_id: @ticket }, format: :xwr
    end

    # assert_response :sons
  end
end
