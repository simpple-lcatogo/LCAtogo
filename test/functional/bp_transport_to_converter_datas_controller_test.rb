require 'test_helper'

class BpTransportToConverterDatasControllerTest < ActionController::TestCase
  setup do
    @bp_transport_to_converter_data = bp_transport_to_converter_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_transport_to_converter_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_transport_to_converter_data" do
    assert_difference('BpTransportToConverterData.count') do
      post :create, :bp_transport_to_converter_data => @bp_transport_to_converter_data.attributes
    end

    assert_redirected_to bp_transport_to_converter_data_path(assigns(:bp_transport_to_converter_data))
  end

  test "should show bp_transport_to_converter_data" do
    get :show, :id => @bp_transport_to_converter_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_transport_to_converter_data.to_param
    assert_response :success
  end

  test "should update bp_transport_to_converter_data" do
    put :update, :id => @bp_transport_to_converter_data.to_param, :bp_transport_to_converter_data => @bp_transport_to_converter_data.attributes
    assert_redirected_to bp_transport_to_converter_data_path(assigns(:bp_transport_to_converter_data))
  end

  test "should destroy bp_transport_to_converter_data" do
    assert_difference('BpTransportToConverterData.count', -1) do
      delete :destroy, :id => @bp_transport_to_converter_data.to_param
    end

    assert_redirected_to bp_transport_to_converter_datas_path
  end
end
