require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  
  def setup
    @mal = users(:mal)
    @zoey = users(:zoey)
    @coop = coops(:citymarket)
    @other_coop = coops(:adamant)
    @membership = Membership.new(member_id:      users(:aaron).id,
                                 joined_coop_id: coops(:adamant).id)
  end

  test "should be valid" do
    assert @membership.valid?
  end

  test "should require a member_id" do
    @membership.member_id = nil
    assert_not @membership.valid?
  end

  test "should require a joined_coop_id" do
    @membership.member_id = nil
    assert_not @membership.valid?
  end

  test "coop should add and remove member" do
    assert_not @coop.member?(@mal)
    @coop.add_member(@mal)
    assert @coop.member?(@mal)
    assert @mal.joined?(@coop)
    @coop.remove_member(@mal)
    assert_not @coop.member?(@mal)
  end

  test "coop should add two members" do
    assert_equal @coop.members.size, 0
    @coop.add_member(@mal)
    @coop.add_member(@zoey)
    assert_equal @coop.members.size, 2
  end

  test "user should join and leave coop" do
    assert_not @mal.joined?(@coop)
    @mal.join_coop(@coop)
    assert @mal.joined?(@coop)
    assert @coop.member?(@mal)
    @mal.leave_coop(@coop)
    assert_not @mal.joined?(@coop)
end

  test "user should join two coops" do
    assert_equal @mal.joined_coops.size, 0
    @mal.join_coop(@coop)
    @mal.join_coop(@other_coop)
    assert_equal @mal.joined_coops.size, 2
  end

#  test "should not allow duplicate memberships" do
#    assert_equal @coop.members.size, 0
#    @coop.add_member(@mal)
#    assert_equal @coop.members.size, 1
#    @coop.add_member(@mal)
#    assert_equal @coop.members.size, 1
#  end

end
