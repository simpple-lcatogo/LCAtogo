require 'test_helper'

class BpMaterialDatasControllerTest < ActionController::TestCase
  setup do
    @bp_material_data = bp_material_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_material_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_material_data" do
    assert_difference('BpMaterialData.count') do
      post :create, :bp_material_data => @bp_material_data.attributes
    end

    assert_redirected_to bp_material_data_path(assigns(:bp_material_data))
  end

  test "should show bp_material_data" do
    get :show, :id => @bp_material_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_material_data.to_param
    assert_response :success
  end

  test "should update bp_material_data" do
    put :update, :id => @bp_material_data.to_param, :bp_material_data => @bp_material_data.attributes
    assert_redirected_to bp_material_data_path(assigns(:bp_material_data))
  end

  test "should destroy bp_material_data" do
    assert_difference('BpMaterialData.count', -1) do
      delete :destroy, :id => @bp_material_data.to_param
    end

    assert_redirected_to bp_material_datas_path
  end
end
