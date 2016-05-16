require 'test_helper'
class ConversationTest < ActiveSupport::TestCase

  test "should create conversation" do
    @ticket = tickets(:one)
    
    assert_difference('Conversation.count', 1) do
      Conversation.create content: 'test', ticket: @ticket
    end
  end

  test "should not commennt create without ticket" do
    assert_difference('Conversation.count', 0) do
      Conversation.create content: 'test'
    end
  end

end
