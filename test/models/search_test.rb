require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "filled at least one" do
    query = Search.new()
    query.restname = "Cmpt276";
    #query.restname = "blah"
    assert query.valid?
  end
end
