require 'test_helper'

class IndicatorsControllerTest < ActionController::TestCase
  setup do
    @indicator = indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator" do
    assert_difference('Indicator.count') do
      post :create, :indicator => @indicator.attributes
    end

    assert_redirected_to indicator_path(assigns(:indicator))
  end

  test "should show indicator" do
    get :show, :id => @indicator.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @indicator.to_param
    assert_response :success
  end

  test "should update indicator" do
    put :update, :id => @indicator.to_param, :indicator => @indicator.attributes
    assert_redirected_to indicator_path(assigns(:indicator))
  end

  test "should destroy indicator" do
    assert_difference('Indicator.count', -1) do
      delete :destroy, :id => @indicator.to_param
    end

    assert_redirected_to indicators_path
  end
end
