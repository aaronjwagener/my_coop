require 'test_helper'

class CoopsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:aaron)
  end

  test "index with pagination" do
    log_in_as(@admin)
    get coops_path
    assert_template 'coops/index'
    assert_select 'div.pagination'
    first_page_of_coops = Coop.paginate(page: 1)
    first_page_of_coops.each do |coop|
      assert_select 'a[href=?]', coop_path(coop), text: coop.name
    end
  end
end
