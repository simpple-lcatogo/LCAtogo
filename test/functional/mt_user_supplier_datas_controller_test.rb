require 'test_helper'

class MtUserSupplierDatasControllerTest < ActionController::TestCase
  setup do
    @mt_user_supplier_data = mt_user_supplier_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_user_supplier_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_user_supplier_data" do
    assert_difference('MtUserSupplierData.count') do
      post :create, :mt_user_supplier_data => @mt_user_supplier_data.attributes
    end

    assert_redirected_to mt_user_supplier_data_path(assigns(:mt_user_supplier_data))
  end

  test "should show mt_user_supplier_data" do
    get :show, :id => @mt_user_supplier_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_user_supplier_data.to_param
    assert_response :success
  end

  test "should update mt_user_supplier_data" do
    put :update, :id => @mt_user_supplier_data.to_param, :mt_user_supplier_data => @mt_user_supplier_data.attributes
    assert_redirected_to mt_user_supplier_data_path(assigns(:mt_user_supplier_data))
  end

  test "should destroy mt_user_supplier_data" do
    assert_difference('MtUserSupplierData.count', -1) do
      delete :destroy, :id => @mt_user_supplier_data.to_param
    end

    assert_redirected_to mt_user_supplier_datas_path
  end
end
