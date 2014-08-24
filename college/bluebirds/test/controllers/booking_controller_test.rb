require 'test_helper'

class BookingControllerTest < ActionController::TestCase
  test "should get book" do
    get :book
    assert_response :success
  end

end
