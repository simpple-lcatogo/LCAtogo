require 'test_helper'

class TransportDistributionsControllerTest < ActionController::TestCase
  setup do
    @transport_distribution = transport_distributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_distributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_distribution" do
    assert_difference('TransportDistribution.count') do
      post :create, :transport_distribution => @transport_distribution.attributes
    end

    assert_redirected_to transport_distribution_path(assigns(:transport_distribution))
  end

  test "should show transport_distribution" do
    get :show, :id => @transport_distribution.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transport_distribution.to_param
    assert_response :success
  end

  test "should update transport_distribution" do
    put :update, :id => @transport_distribution.to_param, :transport_distribution => @transport_distribution.attributes
    assert_redirected_to transport_distribution_path(assigns(:transport_distribution))
  end

  test "should destroy transport_distribution" do
    assert_difference('TransportDistribution.count', -1) do
      delete :destroy, :id => @transport_distribution.to_param
    end

    assert_redirected_to transport_distributions_path
  end
end
