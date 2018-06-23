require 'test_helper'

class CoopsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:aaron)
    @coop = coops(:citymarket)
  end

  test "should reload page with errors on unsuccessful edit" do
   log_in_as(@user)
   get edit_coop_path(@coop)
   assert_template('coops/edit')
   patch coop_path(@coop), params: { coop: { name:        "   ",
                                             description: "   "  } }
   assert_template('coops/edit')
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_coop_path(@coop)
    assert_template('coops/edit')
    name = "Onion River Coop"
    description = "The best coop in Burlington :)"
    patch coop_path(@coop), params: { coop: { name:        name,
                                             description: description } }
    assert_not flash.empty?
    assert_redirected_to @coop
    @coop.reload
    assert_equal name,        @coop.name
    assert_equal description, @coop.description
  end

end
