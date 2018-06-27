require 'test_helper'

class MembershipPagesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:kaylee)
    @coop = coops(:fullbarrel)
    log_in_as(@user)
  end

  test "joined_coops page" do
    get joined_coops_user_path(@user)
    assert_not @user.joined_coops.empty?
    @user.joined_coops.each do |coop|
      assert_select "a[href=?]", coop_path(coop)
    end
  end

  test "members page" do
    get members_coop_path(@coop)
    assert_not @coop.members.empty?
    @coop.members.each do |member|
      assert_select "a[href=?]", user_path(member)
    end
  end
end
