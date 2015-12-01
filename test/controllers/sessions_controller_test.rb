require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
        @user = User.new(name: "ExUser", email: "life@sfu.ca")
  end
  test "should get new" do
    get :new
    assert_response :success
  end

end
