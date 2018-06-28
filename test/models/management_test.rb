require 'test_helper'

class ManagementTest < ActiveSupport::TestCase
  def setup
    @mal = users(:mal)
    @zoey = users(:zoey)
    @coop = coops(:adamant)
    @other_coop = coops(:citymarket)
    @management = Management.new(manager_id:      users(:aaron).id,
                                 managed_coop_id: coops(:adamant).id)
  end

  test "should be valid" do
    assert @management.valid?
  end

  test "should require a manager_id" do
    @management.manager_id = nil
    assert_not @management.valid?
  end

  test "should require a managed_coop_id" do
    @management.managed_coop_id = nil
    assert_not @management.valid?
  end

  test "coop should add and remove manager" do
    assert_not @coop.manager?(@mal)
    @coop.add_manager(@mal)
    assert @coop.manager?(@mal)
    assert @mal.managed?(@coop)
    @coop.remove_manager(@mal)
    assert_not @coop.manager?(@mal)
  end
end
