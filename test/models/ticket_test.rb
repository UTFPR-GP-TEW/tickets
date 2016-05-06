require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  def setup
    @ticket = tickets(:one)
  end

  test "should add the fixtures" do
    assert_not_equal 0, Ticket.count
  end

  test "should not ticket create without title" do
    @ticket.title = nil
    assert_not @ticket.valid?
  end

  test "should not ticket create without description" do
    @ticket.description = nil
    assert_not @ticket.valid?
  end

  test "should not ticket create without status" do
    @ticket.status = nil
    assert_not @ticket.valid?
  end

  test "should not ticket create without project_id" do
    @ticket.project_id = nil
    assert_not @ticket.valid?
  end



  test "should not valid_ticket title minimal_length" do
    @ticket.title = "Project"
    assert_not @ticket.valid?
  end

  test "should not valid_ticket description minimal_length" do
    @ticket.description = "Project"
    assert_not @ticket.valid?
  end

  test "order should be most recent first" do
    assert_equal tickets(:one), Ticket.first
  end

end
