require 'test_helper'

class UsernameTest < ActiveSupport::TestCase
  test "no first name" do
      username = Username.new(
        first_name: "first",
        email: "example@dom.com",
        password_digest: "asdfa"
      )
      username.last_name = "last"
      assert_not username.valid?
  end
end
