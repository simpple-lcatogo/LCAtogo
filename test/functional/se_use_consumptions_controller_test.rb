require 'test_helper'

class SeUseConsumptionsControllerTest < ActionController::TestCase
  setup do
    @se_use_consumption = se_use_consumptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_consumptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_consumption" do
    assert_difference('SeUseConsumption.count') do
      post :create, :se_use_consumption => @se_use_consumption.attributes
    end

    assert_redirected_to se_use_consumption_path(assigns(:se_use_consumption))
  end

  test "should show se_use_consumption" do
    get :show, :id => @se_use_consumption.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_consumption.to_param
    assert_response :success
  end

  test "should update se_use_consumption" do
    put :update, :id => @se_use_consumption.to_param, :se_use_consumption => @se_use_consumption.attributes
    assert_redirected_to se_use_consumption_path(assigns(:se_use_consumption))
  end

  test "should destroy se_use_consumption" do
    assert_difference('SeUseConsumption.count', -1) do
      delete :destroy, :id => @se_use_consumption.to_param
    end

    assert_redirected_to se_use_consumptions_path
  end
end
