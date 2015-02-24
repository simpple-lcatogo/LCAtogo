require 'test_helper'

class BpElectronicEconomicsControllerTest < ActionController::TestCase
  setup do
    @bp_electronic_economic = bp_electronic_economics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_electronic_economics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_electronic_economic" do
    assert_difference('BpElectronicEconomic.count') do
      post :create, :bp_electronic_economic => @bp_electronic_economic.attributes
    end

    assert_redirected_to bp_electronic_economic_path(assigns(:bp_electronic_economic))
  end

  test "should show bp_electronic_economic" do
    get :show, :id => @bp_electronic_economic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_electronic_economic.to_param
    assert_response :success
  end

  test "should update bp_electronic_economic" do
    put :update, :id => @bp_electronic_economic.to_param, :bp_electronic_economic => @bp_electronic_economic.attributes
    assert_redirected_to bp_electronic_economic_path(assigns(:bp_electronic_economic))
  end

  test "should destroy bp_electronic_economic" do
    assert_difference('BpElectronicEconomic.count', -1) do
      delete :destroy, :id => @bp_electronic_economic.to_param
    end

    assert_redirected_to bp_electronic_economics_path
  end
end
