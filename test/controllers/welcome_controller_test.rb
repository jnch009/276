require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get before action" do
    get :index
    assert_response :redirect
  end

end
