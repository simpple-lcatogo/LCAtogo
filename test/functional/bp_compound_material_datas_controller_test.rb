require 'test_helper'

class BpCompoundMaterialDatasControllerTest < ActionController::TestCase
  setup do
    @bp_compound_material_data = bp_compound_material_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_compound_material_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_compound_material_data" do
    assert_difference('BpCompoundMaterialData.count') do
      post :create, :bp_compound_material_data => @bp_compound_material_data.attributes
    end

    assert_redirected_to bp_compound_material_data_path(assigns(:bp_compound_material_data))
  end

  test "should show bp_compound_material_data" do
    get :show, :id => @bp_compound_material_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_compound_material_data.to_param
    assert_response :success
  end

  test "should update bp_compound_material_data" do
    put :update, :id => @bp_compound_material_data.to_param, :bp_compound_material_data => @bp_compound_material_data.attributes
    assert_redirected_to bp_compound_material_data_path(assigns(:bp_compound_material_data))
  end

  test "should destroy bp_compound_material_data" do
    assert_difference('BpCompoundMaterialData.count', -1) do
      delete :destroy, :id => @bp_compound_material_data.to_param
    end

    assert_redirected_to bp_compound_material_datas_path
  end
end
