require 'test_helper'

class MaterialDatasControllerTest < ActionController::TestCase
  setup do
    @material_data = material_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_data" do
    assert_difference('MaterialData.count') do
      post :create, :material_data => @material_data.attributes
    end

    assert_redirected_to material_data_path(assigns(:material_data))
  end

  test "should show material_data" do
    get :show, :id => @material_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @material_data.to_param
    assert_response :success
  end

  test "should update material_data" do
    put :update, :id => @material_data.to_param, :material_data => @material_data.attributes
    assert_redirected_to material_data_path(assigns(:material_data))
  end

  test "should destroy material_data" do
    assert_difference('MaterialData.count', -1) do
      delete :destroy, :id => @material_data.to_param
    end

    assert_redirected_to material_datas_path
  end
end
