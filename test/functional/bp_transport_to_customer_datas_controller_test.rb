require 'test_helper'

class BpTransportToCustomerDatasControllerTest < ActionController::TestCase
  setup do
    @bp_transport_to_customer_data = bp_transport_to_customer_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_transport_to_customer_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_transport_to_customer_data" do
    assert_difference('BpTransportToCustomerData.count') do
      post :create, :bp_transport_to_customer_data => @bp_transport_to_customer_data.attributes
    end

    assert_redirected_to bp_transport_to_customer_data_path(assigns(:bp_transport_to_customer_data))
  end

  test "should show bp_transport_to_customer_data" do
    get :show, :id => @bp_transport_to_customer_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_transport_to_customer_data.to_param
    assert_response :success
  end

  test "should update bp_transport_to_customer_data" do
    put :update, :id => @bp_transport_to_customer_data.to_param, :bp_transport_to_customer_data => @bp_transport_to_customer_data.attributes
    assert_redirected_to bp_transport_to_customer_data_path(assigns(:bp_transport_to_customer_data))
  end

  test "should destroy bp_transport_to_customer_data" do
    assert_difference('BpTransportToCustomerData.count', -1) do
      delete :destroy, :id => @bp_transport_to_customer_data.to_param
    end

    assert_redirected_to bp_transport_to_customer_datas_path
  end
end
