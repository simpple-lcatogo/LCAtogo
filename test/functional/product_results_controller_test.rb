require 'test_helper'

class ProductResultsControllerTest < ActionController::TestCase
  setup do
    @product_result = product_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_result" do
    assert_difference('ProductResult.count') do
      post :create, :product_result => @product_result.attributes
    end

    assert_redirected_to product_result_path(assigns(:product_result))
  end

  test "should show product_result" do
    get :show, :id => @product_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_result.to_param
    assert_response :success
  end

  test "should update product_result" do
    put :update, :id => @product_result.to_param, :product_result => @product_result.attributes
    assert_redirected_to product_result_path(assigns(:product_result))
  end

  test "should destroy product_result" do
    assert_difference('ProductResult.count', -1) do
      delete :destroy, :id => @product_result.to_param
    end

    assert_redirected_to product_results_path
  end
end
