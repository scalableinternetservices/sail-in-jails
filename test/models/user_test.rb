require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "my_sample_password")
  end

  test "Valid Email" do
    ['', 'invalid', 'email@', '@@', 'dot.com'].each do |email|
      @user = User.new(name: "Test User", email: email)
      assert_not @user.valid?
    end
  end

  test "Presence" do
    @user = User.new(name: "  ", email: "  ")
    assert_not @user.valid?
    @user.name = "Valid name"
    assert_not @user.valid?
    @user.email = "valid@email.com"
    assert_not @user.valid?
    @user.password = "new_password"
    assert @user.valid?
  end

  test "Email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
