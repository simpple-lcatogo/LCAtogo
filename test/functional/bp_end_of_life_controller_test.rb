require 'test_helper'

class BpEndOfLifeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
