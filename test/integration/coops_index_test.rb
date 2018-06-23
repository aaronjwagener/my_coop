require 'test_helper'

class CoopsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:aaron)
    @non_admin = users(:mal)
    @coop = coops(:adamant)
  end

  test "index with pagination and delete as admin" do
    log_in_as(@admin)
    get coops_path
    assert_template 'coops/index'
    assert_select 'div.pagination'
    first_page_of_coops = Coop.paginate(page: 1)
    first_page_of_coops.each do |coop|
      assert_select 'a[href=?]', coop_path(coop), text: coop.name
      assert_select 'a[href=?]', coop_path(coop), text: 'delete'
    end
    assert_difference 'Coop.count', -1 do
      delete coop_path(@coop)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    assert_no_difference 'Coop.count' do
      delete coop_path(@coop)
    end
  end

end
