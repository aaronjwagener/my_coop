require 'test_helper'

class ManagementsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:aaron)
    @non_admin = users(:mal)
    @user = users(:zoey)
    @coop = coops(:adamant)
  end
                                                                                
  test "should not add/remove managments if not logged in" do
    assert_no_difference 'Management.count' do
      post managements_path, params: { management: {
                                       manager_id:      @user.id,
                                       managed_coop_id: @coop.id } }            
    end
    assert_redirected_to login_url
  end
                                                                                
  test "non-admins should not add/remove managements" do
    log_in_as @non_admin
    assert_no_difference 'Management.count' do
      post managements_path, params: { managment: {
                                       manager_id:      @user.id,
                                       managed_coop_id: @coop.id } }
    end
    assert_redirected_to root_url
  end
end
