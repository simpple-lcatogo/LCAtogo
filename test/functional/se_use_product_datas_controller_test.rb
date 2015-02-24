require 'test_helper'

class SeUseProductDatasControllerTest < ActionController::TestCase
  setup do
    @se_use_product_data = se_use_product_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_product_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_product_data" do
    assert_difference('SeUseProductData.count') do
      post :create, :se_use_product_data => @se_use_product_data.attributes
    end

    assert_redirected_to se_use_product_data_path(assigns(:se_use_product_data))
  end

  test "should show se_use_product_data" do
    get :show, :id => @se_use_product_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_product_data.to_param
    assert_response :success
  end

  test "should update se_use_product_data" do
    put :update, :id => @se_use_product_data.to_param, :se_use_product_data => @se_use_product_data.attributes
    assert_redirected_to se_use_product_data_path(assigns(:se_use_product_data))
  end

  test "should destroy se_use_product_data" do
    assert_difference('SeUseProductData.count', -1) do
      delete :destroy, :id => @se_use_product_data.to_param
    end

    assert_redirected_to se_use_product_datas_path
  end
end
