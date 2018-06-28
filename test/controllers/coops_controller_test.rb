require 'test_helper'

class CoopsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin        = users(:aaron)
    @regular_user = users(:mal)
    @coop         = coops(:adamant)
  end

  
  # Helper function to package checking the flash with redirecting
  def assert_redirected_to_login
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  # Authentication tests
  
  test "index requires logged_in" do
    get coops_path
    assert_redirected_to_login
  end
  
  test "show requires logged_in" do
    get coop_path(@coop)
    assert_redirected_to_login
  end

  test "new requires logged_in + admin" do
    get new_coop_path
    assert_redirected_to_login
    log_in_as(@regular_user)
    get new_coop_path
    assert_redirected_to root_url
  end

  test "create requires logged_in + admin" do
    assert_no_difference 'Coop.count' do
      post coops_path, params: { coop: { 
                                   name: "New Hearts Cooperative",
                                   description: "A great place to be." } }
    end
    assert_redirected_to_login
    log_in_as(@regular_user)
    assert_no_difference 'Coop.count' do
      post coops_path, params: { coop: { 
                                   name: "New Hearts Cooperative",
                                   description: "A great place to be." } }
    end
    assert_redirected_to root_url
  end

  # INCOMPLETE
  test "edit requires logged_in + manager" do
    get edit_coop_path(@coop)
    assert_redirected_to_login
    
    # Implement manager screen

  end

  # INCOMPLETE
  test "update requires logged_in + manager" do
    name = @coop.name 
    description = @coop.description
    new_name = name + " New"
    new_description = description + " New"
    patch coop_path(@coop), params: { coop: { name: new_name,
                                              description: new_description } }
    assert_redirected_to_login
    @coop.reload
    assert @coop.name == name
    assert @coop.description == description
    
    #Implement manager screen

  end

  test "destroy requires logged_in + admin" do
    assert_no_difference 'Coop.count' do
      delete coop_path(@coop)
    end
    assert_redirected_to_login
    log_in_as(@regular_user)
    assert_no_difference 'Coop.count' do
      delete coop_path(@coop)
    end
    assert_redirected_to root_url
  end

  test "should redirect members when not logged in" do
    get members_coop_path(@coop)
    assert_redirected_to login_url
  end

  test "should redirect managers page when not logged in" do
    get managers_coop_path(@coop)
    assert_redirected_to login_url
  end
end
