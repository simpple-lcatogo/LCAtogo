require 'test_helper'

class MtManufacturingResourceDatasControllerTest < ActionController::TestCase
  setup do
    @mt_manufacturing_resource_data = mt_manufacturing_resource_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_manufacturing_resource_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_manufacturing_resource_data" do
    assert_difference('MtManufacturingResourceData.count') do
      post :create, :mt_manufacturing_resource_data => @mt_manufacturing_resource_data.attributes
    end

    assert_redirected_to mt_manufacturing_resource_data_path(assigns(:mt_manufacturing_resource_data))
  end

  test "should show mt_manufacturing_resource_data" do
    get :show, :id => @mt_manufacturing_resource_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_manufacturing_resource_data.to_param
    assert_response :success
  end

  test "should update mt_manufacturing_resource_data" do
    put :update, :id => @mt_manufacturing_resource_data.to_param, :mt_manufacturing_resource_data => @mt_manufacturing_resource_data.attributes
    assert_redirected_to mt_manufacturing_resource_data_path(assigns(:mt_manufacturing_resource_data))
  end

  test "should destroy mt_manufacturing_resource_data" do
    assert_difference('MtManufacturingResourceData.count', -1) do
      delete :destroy, :id => @mt_manufacturing_resource_data.to_param
    end

    assert_redirected_to mt_manufacturing_resource_datas_path
  end
end
