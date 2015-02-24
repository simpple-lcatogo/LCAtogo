require 'test_helper'

class StMaterialDatasControllerTest < ActionController::TestCase
  setup do
    @st_material_data = st_material_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_material_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_material_data" do
    assert_difference('StMaterialData.count') do
      post :create, :st_material_data => @st_material_data.attributes
    end

    assert_redirected_to st_material_data_path(assigns(:st_material_data))
  end

  test "should show st_material_data" do
    get :show, :id => @st_material_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_material_data.to_param
    assert_response :success
  end

  test "should update st_material_data" do
    put :update, :id => @st_material_data.to_param, :st_material_data => @st_material_data.attributes
    assert_redirected_to st_material_data_path(assigns(:st_material_data))
  end

  test "should destroy st_material_data" do
    assert_difference('StMaterialData.count', -1) do
      delete :destroy, :id => @st_material_data.to_param
    end

    assert_redirected_to st_material_datas_path
  end
end
