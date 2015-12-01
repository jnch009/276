require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    def setup 
        @user = users(:jeremy)
    end
    # called after every single test
     def teardown
        @user = nil
     end
 
    test "getting new action" do
        get :new
    end
    test "creating a user" do
        assert_difference('User.count') do
          post :create, user: {name: "Jeremy", email: "jngcheng@sfu.ca", password: "foobar", password_confirmation: "foobar"}
        end
        assert_redirected_to user_path(assigns(:user))
    end
    test "showing user" do
        get :show, id: @user.id
        assert_response :success
    end
end
