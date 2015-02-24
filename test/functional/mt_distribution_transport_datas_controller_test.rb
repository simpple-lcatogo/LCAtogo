require 'test_helper'

class MtDistributionTransportDatasControllerTest < ActionController::TestCase
  setup do
    @mt_distribution_transport_data = mt_distribution_transport_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_distribution_transport_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_distribution_transport_data" do
    assert_difference('MtDistributionTransportData.count') do
      post :create, :mt_distribution_transport_data => @mt_distribution_transport_data.attributes
    end

    assert_redirected_to mt_distribution_transport_data_path(assigns(:mt_distribution_transport_data))
  end

  test "should show mt_distribution_transport_data" do
    get :show, :id => @mt_distribution_transport_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_distribution_transport_data.to_param
    assert_response :success
  end

  test "should update mt_distribution_transport_data" do
    put :update, :id => @mt_distribution_transport_data.to_param, :mt_distribution_transport_data => @mt_distribution_transport_data.attributes
    assert_redirected_to mt_distribution_transport_data_path(assigns(:mt_distribution_transport_data))
  end

  test "should destroy mt_distribution_transport_data" do
    assert_difference('MtDistributionTransportData.count', -1) do
      delete :destroy, :id => @mt_distribution_transport_data.to_param
    end

    assert_redirected_to mt_distribution_transport_datas_path
  end
end
