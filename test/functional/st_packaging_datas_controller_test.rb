require 'test_helper'

class StPackagingDatasControllerTest < ActionController::TestCase
  setup do
    @st_packaging_data = st_packaging_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_packaging_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_packaging_data" do
    assert_difference('StPackagingData.count') do
      post :create, :st_packaging_data => @st_packaging_data.attributes
    end

    assert_redirected_to st_packaging_data_path(assigns(:st_packaging_data))
  end

  test "should show st_packaging_data" do
    get :show, :id => @st_packaging_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_packaging_data.to_param
    assert_response :success
  end

  test "should update st_packaging_data" do
    put :update, :id => @st_packaging_data.to_param, :st_packaging_data => @st_packaging_data.attributes
    assert_redirected_to st_packaging_data_path(assigns(:st_packaging_data))
  end

  test "should destroy st_packaging_data" do
    assert_difference('StPackagingData.count', -1) do
      delete :destroy, :id => @st_packaging_data.to_param
    end

    assert_redirected_to st_packaging_datas_path
  end
end
