require 'test_helper'

class PackagingDistributionsControllerTest < ActionController::TestCase
  setup do
    @packaging_distribution = packaging_distributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packaging_distributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packaging_distribution" do
    assert_difference('PackagingDistribution.count') do
      post :create, :packaging_distribution => @packaging_distribution.attributes
    end

    assert_redirected_to packaging_distribution_path(assigns(:packaging_distribution))
  end

  test "should show packaging_distribution" do
    get :show, :id => @packaging_distribution.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @packaging_distribution.to_param
    assert_response :success
  end

  test "should update packaging_distribution" do
    put :update, :id => @packaging_distribution.to_param, :packaging_distribution => @packaging_distribution.attributes
    assert_redirected_to packaging_distribution_path(assigns(:packaging_distribution))
  end

  test "should destroy packaging_distribution" do
    assert_difference('PackagingDistribution.count', -1) do
      delete :destroy, :id => @packaging_distribution.to_param
    end

    assert_redirected_to packaging_distributions_path
  end
end
