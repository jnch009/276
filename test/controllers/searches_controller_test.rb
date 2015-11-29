require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  def setup
    @search = searches(:one)
  end
 
  def teardown
    @search = nil
  end
  
  #testing new 
  test "should get new" do
      get :new
      assert_response :success
  end
  #testing create 
  test "redirecting to search" do
      assert_difference('Search.count') do
        post :create, search: {location: 'Vancouver,BC'}
      end
      assert_redirected_to search_path(assigns(:search))
  end
  #testing show
  test "should show search" do
    get :show, id: @search.id
    assert_response :success
  end
  
end
