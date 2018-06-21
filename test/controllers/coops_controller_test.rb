require 'test_helper'

class CoopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coops_new_url
    assert_response :success
  end

  test "create should not work with invalid info" do
    get coops_new_path
    assert_no_difference 'Coop.count' do
      post coops_path, params: { coop: { name: "",
                                             description: "" } }
    end
    assert_template 'coops/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "create should work with valid info" do
    get coops_new_path
    assert_difference 'Coop.count' do
      post coops_path, params: { coop: { name: "New Day Cooperative",
                                         description: "The place to be!" } }
    end
    follow_redirect!
    assert_template 'coops/show'
    assert_not flash.empty?
  end

end
