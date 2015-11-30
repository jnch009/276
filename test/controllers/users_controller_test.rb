require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.new(name: "ExUser", email: "life@sfu.ca")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  

end
