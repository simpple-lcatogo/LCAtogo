require 'test_helper'

class SeUseConsumptionUtilityDatasControllerTest < ActionController::TestCase
  setup do
    @se_use_consumption_utility_data = se_use_consumption_utility_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_consumption_utility_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_consumption_utility_data" do
    assert_difference('SeUseConsumptionUtilityData.count') do
      post :create, :se_use_consumption_utility_data => @se_use_consumption_utility_data.attributes
    end

    assert_redirected_to se_use_consumption_utility_data_path(assigns(:se_use_consumption_utility_data))
  end

  test "should show se_use_consumption_utility_data" do
    get :show, :id => @se_use_consumption_utility_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_consumption_utility_data.to_param
    assert_response :success
  end

  test "should update se_use_consumption_utility_data" do
    put :update, :id => @se_use_consumption_utility_data.to_param, :se_use_consumption_utility_data => @se_use_consumption_utility_data.attributes
    assert_redirected_to se_use_consumption_utility_data_path(assigns(:se_use_consumption_utility_data))
  end

  test "should destroy se_use_consumption_utility_data" do
    assert_difference('SeUseConsumptionUtilityData.count', -1) do
      delete :destroy, :id => @se_use_consumption_utility_data.to_param
    end

    assert_redirected_to se_use_consumption_utility_datas_path
  end
end
