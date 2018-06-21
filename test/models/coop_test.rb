require 'test_helper'

class CoopTest < ActiveSupport::TestCase

  def setup
    @coop = Coop.new(name: "Onion River Coop", description: "One dope place.")
  end

  test "should be valid" do
    assert @coop.valid?
  end

  test "name should be present" do
    @coop.name = "        "
    assert_not @coop.valid?
  end

  test "name should not be too long" do
    @coop.name = "a" * 51
    assert_not @coop.valid?
  end

  test "description should be present" do
    @coop.description = "    "
    assert_not @coop.valid?
  end

end
