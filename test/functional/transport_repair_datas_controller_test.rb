require 'test_helper'

class TransportRepairDatasControllerTest < ActionController::TestCase
  setup do
    @transport_repair_data = transport_repair_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_repair_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_repair_data" do
    assert_difference('TransportRepairData.count') do
      post :create, :transport_repair_data => @transport_repair_data.attributes
    end

    assert_redirected_to transport_repair_data_path(assigns(:transport_repair_data))
  end

  test "should show transport_repair_data" do
    get :show, :id => @transport_repair_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transport_repair_data.to_param
    assert_response :success
  end

  test "should update transport_repair_data" do
    put :update, :id => @transport_repair_data.to_param, :transport_repair_data => @transport_repair_data.attributes
    assert_redirected_to transport_repair_data_path(assigns(:transport_repair_data))
  end

  test "should destroy transport_repair_data" do
    assert_difference('TransportRepairData.count', -1) do
      delete :destroy, :id => @transport_repair_data.to_param
    end

    assert_redirected_to transport_repair_datas_path
  end
end
