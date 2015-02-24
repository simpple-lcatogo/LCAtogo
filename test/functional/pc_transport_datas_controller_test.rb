require 'test_helper'

class PcTransportDatasControllerTest < ActionController::TestCase
  setup do
    @pc_transport_data = pc_transport_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pc_transport_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc_transport_data" do
    assert_difference('PcTransportData.count') do
      post :create, :pc_transport_data => @pc_transport_data.attributes
    end

    assert_redirected_to pc_transport_data_path(assigns(:pc_transport_data))
  end

  test "should show pc_transport_data" do
    get :show, :id => @pc_transport_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pc_transport_data.to_param
    assert_response :success
  end

  test "should update pc_transport_data" do
    put :update, :id => @pc_transport_data.to_param, :pc_transport_data => @pc_transport_data.attributes
    assert_redirected_to pc_transport_data_path(assigns(:pc_transport_data))
  end

  test "should destroy pc_transport_data" do
    assert_difference('PcTransportData.count', -1) do
      delete :destroy, :id => @pc_transport_data.to_param
    end

    assert_redirected_to pc_transport_datas_path
  end
end
