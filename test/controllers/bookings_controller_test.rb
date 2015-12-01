require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
    def setup
        @booking = bookings(:one)
    end
    test "testing before action" do
        get :new
        assert_response 302
    end
    test "new" do
        get :new
        assert_response :success
    end
    test "creating a booking" do
        assert_difference('Booking.count') do
          post :create, booking: {people: 10, time: "11:05:12", restaurant_date: "11/05/15"}
        end
        assert_redirected_to booking_path(assigns(:booking))
    end
    test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete :destroy, id: @booking.id
    end
 
    assert_redirected_to bookings_path
  end
end
