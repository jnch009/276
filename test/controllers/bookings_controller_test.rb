require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
    def setup
        @booking = bookings(:one)
        @user = User.new(name: "ExUser", email: "life@sfu.ca")
    end
    def teardown
        @booking = nil
    end
    test "should get new" do
        get :new
        assert_response 302
    end
end
