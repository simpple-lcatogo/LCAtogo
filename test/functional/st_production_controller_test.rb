require 'test_helper'

class StProductionControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

  test "should get intro" do
    get :intro
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
