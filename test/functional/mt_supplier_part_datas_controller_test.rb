require 'test_helper'

class MtSupplierPartDatasControllerTest < ActionController::TestCase
  setup do
    @mt_supplier_part_data = mt_supplier_part_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_supplier_part_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_supplier_part_data" do
    assert_difference('MtSupplierPartData.count') do
      post :create, :mt_supplier_part_data => @mt_supplier_part_data.attributes
    end

    assert_redirected_to mt_supplier_part_data_path(assigns(:mt_supplier_part_data))
  end

  test "should show mt_supplier_part_data" do
    get :show, :id => @mt_supplier_part_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_supplier_part_data.to_param
    assert_response :success
  end

  test "should update mt_supplier_part_data" do
    put :update, :id => @mt_supplier_part_data.to_param, :mt_supplier_part_data => @mt_supplier_part_data.attributes
    assert_redirected_to mt_supplier_part_data_path(assigns(:mt_supplier_part_data))
  end

  test "should destroy mt_supplier_part_data" do
    assert_difference('MtSupplierPartData.count', -1) do
      delete :destroy, :id => @mt_supplier_part_data.to_param
    end

    assert_redirected_to mt_supplier_part_datas_path
  end
end
