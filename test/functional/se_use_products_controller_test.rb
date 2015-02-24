require 'test_helper'

class SeUseProductsControllerTest < ActionController::TestCase
  setup do
    @se_use_product = se_use_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_product" do
    assert_difference('SeUseProduct.count') do
      post :create, :se_use_product => @se_use_product.attributes
    end

    assert_redirected_to se_use_product_path(assigns(:se_use_product))
  end

  test "should show se_use_product" do
    get :show, :id => @se_use_product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_product.to_param
    assert_response :success
  end

  test "should update se_use_product" do
    put :update, :id => @se_use_product.to_param, :se_use_product => @se_use_product.attributes
    assert_redirected_to se_use_product_path(assigns(:se_use_product))
  end

  test "should destroy se_use_product" do
    assert_difference('SeUseProduct.count', -1) do
      delete :destroy, :id => @se_use_product.to_param
    end

    assert_redirected_to se_use_products_path
  end
end
