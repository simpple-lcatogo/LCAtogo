require 'test_helper'

class BpManufacturingTransportDatasControllerTest < ActionController::TestCase
  setup do
    @bp_manufacturing_transport_data = bp_manufacturing_transport_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_manufacturing_transport_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_manufacturing_transport_data" do
    assert_difference('BpManufacturingTransportData.count') do
      post :create, :bp_manufacturing_transport_data => @bp_manufacturing_transport_data.attributes
    end

    assert_redirected_to bp_manufacturing_transport_data_path(assigns(:bp_manufacturing_transport_data))
  end

  test "should show bp_manufacturing_transport_data" do
    get :show, :id => @bp_manufacturing_transport_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_manufacturing_transport_data.to_param
    assert_response :success
  end

  test "should update bp_manufacturing_transport_data" do
    put :update, :id => @bp_manufacturing_transport_data.to_param, :bp_manufacturing_transport_data => @bp_manufacturing_transport_data.attributes
    assert_redirected_to bp_manufacturing_transport_data_path(assigns(:bp_manufacturing_transport_data))
  end

  test "should destroy bp_manufacturing_transport_data" do
    assert_difference('BpManufacturingTransportData.count', -1) do
      delete :destroy, :id => @bp_manufacturing_transport_data.to_param
    end

    assert_redirected_to bp_manufacturing_transport_datas_path
  end
end
