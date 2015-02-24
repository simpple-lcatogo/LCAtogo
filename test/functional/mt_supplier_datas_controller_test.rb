require 'test_helper'

class MtSupplierDatasControllerTest < ActionController::TestCase
  setup do
    @mt_supplier_data = mt_supplier_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_supplier_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_supplier_data" do
    assert_difference('MtSupplierData.count') do
      post :create, :mt_supplier_data => @mt_supplier_data.attributes
    end

    assert_redirected_to mt_supplier_data_path(assigns(:mt_supplier_data))
  end

  test "should show mt_supplier_data" do
    get :show, :id => @mt_supplier_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_supplier_data.to_param
    assert_response :success
  end

  test "should update mt_supplier_data" do
    put :update, :id => @mt_supplier_data.to_param, :mt_supplier_data => @mt_supplier_data.attributes
    assert_redirected_to mt_supplier_data_path(assigns(:mt_supplier_data))
  end

  test "should destroy mt_supplier_data" do
    assert_difference('MtSupplierData.count', -1) do
      delete :destroy, :id => @mt_supplier_data.to_param
    end

    assert_redirected_to mt_supplier_datas_path
  end
end
