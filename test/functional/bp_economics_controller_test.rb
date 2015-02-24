require 'test_helper'

class BpEconomicsControllerTest < ActionController::TestCase
  setup do
    @bp_economic = bp_economics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_economics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_economic" do
    assert_difference('BpEconomic.count') do
      post :create, :bp_economic => @bp_economic.attributes
    end

    assert_redirected_to bp_economic_path(assigns(:bp_economic))
  end

  test "should show bp_economic" do
    get :show, :id => @bp_economic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_economic.to_param
    assert_response :success
  end

  test "should update bp_economic" do
    put :update, :id => @bp_economic.to_param, :bp_economic => @bp_economic.attributes
    assert_redirected_to bp_economic_path(assigns(:bp_economic))
  end

  test "should destroy bp_economic" do
    assert_difference('BpEconomic.count', -1) do
      delete :destroy, :id => @bp_economic.to_param
    end

    assert_redirected_to bp_economics_path
  end
end
