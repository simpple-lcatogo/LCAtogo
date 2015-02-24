require 'test_helper'

class BpDistributionUserValueControllerTest < ActionController::TestCase
  test "should get update_values" do
    get :update_values
    assert_response :success
  end

end
