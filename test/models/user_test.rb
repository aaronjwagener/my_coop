require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "spaceship", password_confirmation: "spaceship")
  end

  test "valid user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM UsEr@t.co.uk 
                         me-it_is@place.co user.lastname@my.website
                         liz+sheila@plaza-space.org]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_example.com user@example.
                            user@my_web.com user@site+me.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses saved lower-case" do
    mixed_case_email = "UsEr@eXAmPlE.coM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = "      "
    assert_not @user.valid?
  end

  test "password should be minimum length" do
    @user.password = @user.password_confirmation = "hello"
    assert_not @user.valid?
  end

  test "password and confirmation should match" do
    @user.password              = "password"
    @user.password_confirmation = "passward"
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
