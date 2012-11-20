require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get payment" do
    get :payment
    assert_response :success
  end

end
