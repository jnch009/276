require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
   test "should get new" do
     get :new
     assert_response :success
   end
   test "should get create" do
     get :create
     assert_response :success
   end
   test "should destroy" do
     user = Username.new(
       first_name: "Jeremy",
       last_name: "Ng",
       email: "j@sfu.ca",
       password: "123"
      )
      assert_not user.destroy 
   end
end
