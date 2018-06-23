require 'test_helper'

class CoopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coops_new_url
    assert_response :success
  end

end
