require 'test_helper'

class MtDistributionsControllerTest < ActionController::TestCase
  setup do
    @mt_distribution = mt_distributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_distributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_distribution" do
    assert_difference('MtDistribution.count') do
      post :create, :mt_distribution => @mt_distribution.attributes
    end

    assert_redirected_to mt_distribution_path(assigns(:mt_distribution))
  end

  test "should show mt_distribution" do
    get :show, :id => @mt_distribution.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_distribution.to_param
    assert_response :success
  end

  test "should update mt_distribution" do
    put :update, :id => @mt_distribution.to_param, :mt_distribution => @mt_distribution.attributes
    assert_redirected_to mt_distribution_path(assigns(:mt_distribution))
  end

  test "should destroy mt_distribution" do
    assert_difference('MtDistribution.count', -1) do
      delete :destroy, :id => @mt_distribution.to_param
    end

    assert_redirected_to mt_distributions_path
  end
end
