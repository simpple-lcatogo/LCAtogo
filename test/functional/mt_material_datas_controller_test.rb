require 'test_helper'

class MtMaterialDatasControllerTest < ActionController::TestCase
  setup do
    @mt_material_data = mt_material_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_material_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_material_data" do
    assert_difference('MtMaterialData.count') do
      post :create, :mt_material_data => @mt_material_data.attributes
    end

    assert_redirected_to mt_material_data_path(assigns(:mt_material_data))
  end

  test "should show mt_material_data" do
    get :show, :id => @mt_material_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_material_data.to_param
    assert_response :success
  end

  test "should update mt_material_data" do
    put :update, :id => @mt_material_data.to_param, :mt_material_data => @mt_material_data.attributes
    assert_redirected_to mt_material_data_path(assigns(:mt_material_data))
  end

  test "should destroy mt_material_data" do
    assert_difference('MtMaterialData.count', -1) do
      delete :destroy, :id => @mt_material_data.to_param
    end

    assert_redirected_to mt_material_datas_path
  end
end
