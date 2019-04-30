require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name:  "Example User",
      email: "user@example.com",
      password: "foobar", 
      password_confirmation: "foobar",
      affiliation: "test",
      basic_time: "08:00:00",
      specified_time: "09:00:00"
      )
  end

  test "should be valid" do
    assert @user.valid?
  end
  
# name
   test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
# email
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
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

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase,@user.reload.email
  end
  
# password
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

# affiriation
  test "affiliation should be present" do
    @user.affiliation = "     "
    assert_not @user.valid?
  end

  test "affiliation should not be too long" do
    @user.affiliation = "a" * 21
    assert_not @user.valid?
  end

# basic_time
  test "basic_time should be present" do
    @user.basic_time = "     "
    assert_not @user.valid?
  end

# specified_time
  test "specified_time should be present" do
    @user.specified_time = "     "
    assert_not @user.valid?
  end
  
# user_id == user_id onrydestroy
  test "associated works shouldnbe destroyed" do
    @user.save
    @user.works.create!(attendance_time:"2019,4,30,09:00:00")
    assert_difference 'Work.count',-1 do
      @user.destroy
    end
  end

end