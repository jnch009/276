require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:jeremy)
  end
  test "before action working" do
      get :new
      assert_response 302
  end
  test "get index" do 
      get :index
      assert_response :success
      assert_not_nil assigns(:reviews)
  end
end
