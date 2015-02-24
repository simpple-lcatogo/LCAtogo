require 'test_helper'

class StProcessDatasControllerTest < ActionController::TestCase
  setup do
    @st_process_data = st_process_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_process_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_process_data" do
    assert_difference('StProcessData.count') do
      post :create, :st_process_data => @st_process_data.attributes
    end

    assert_redirected_to st_process_data_path(assigns(:st_process_data))
  end

  test "should show st_process_data" do
    get :show, :id => @st_process_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_process_data.to_param
    assert_response :success
  end

  test "should update st_process_data" do
    put :update, :id => @st_process_data.to_param, :st_process_data => @st_process_data.attributes
    assert_redirected_to st_process_data_path(assigns(:st_process_data))
  end

  test "should destroy st_process_data" do
    assert_difference('StProcessData.count', -1) do
      delete :destroy, :id => @st_process_data.to_param
    end

    assert_redirected_to st_process_datas_path
  end
end
