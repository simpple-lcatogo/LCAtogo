require 'test_helper'

class StTransportDatasControllerTest < ActionController::TestCase
  setup do
    @st_transport_data = st_transport_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_transport_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_transport_data" do
    assert_difference('StTransportData.count') do
      post :create, :st_transport_data => @st_transport_data.attributes
    end

    assert_redirected_to st_transport_data_path(assigns(:st_transport_data))
  end

  test "should show st_transport_data" do
    get :show, :id => @st_transport_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_transport_data.to_param
    assert_response :success
  end

  test "should update st_transport_data" do
    put :update, :id => @st_transport_data.to_param, :st_transport_data => @st_transport_data.attributes
    assert_redirected_to st_transport_data_path(assigns(:st_transport_data))
  end

  test "should destroy st_transport_data" do
    assert_difference('StTransportData.count', -1) do
      delete :destroy, :id => @st_transport_data.to_param
    end

    assert_redirected_to st_transport_datas_path
  end
end
