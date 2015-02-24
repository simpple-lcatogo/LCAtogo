require 'test_helper'

class StConsumptionDatasControllerTest < ActionController::TestCase
  setup do
    @st_consumption_data = st_consumption_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_consumption_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_consumption_data" do
    assert_difference('StConsumptionData.count') do
      post :create, :st_consumption_data => @st_consumption_data.attributes
    end

    assert_redirected_to st_consumption_data_path(assigns(:st_consumption_data))
  end

  test "should show st_consumption_data" do
    get :show, :id => @st_consumption_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_consumption_data.to_param
    assert_response :success
  end

  test "should update st_consumption_data" do
    put :update, :id => @st_consumption_data.to_param, :st_consumption_data => @st_consumption_data.attributes
    assert_redirected_to st_consumption_data_path(assigns(:st_consumption_data))
  end

  test "should destroy st_consumption_data" do
    assert_difference('StConsumptionData.count', -1) do
      delete :destroy, :id => @st_consumption_data.to_param
    end

    assert_redirected_to st_consumption_datas_path
  end
end
