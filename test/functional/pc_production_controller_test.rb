require 'test_helper'

class PcProductionControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

  test "should get intro" do
    get :intro
    assert_response :success
  end

end
