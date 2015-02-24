require 'test_helper'

class ProcessDatasControllerTest < ActionController::TestCase
  setup do
    @process_data = process_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_data" do
    assert_difference('ProcessData.count') do
      post :create, :process_data => @process_data.attributes
    end

    assert_redirected_to process_data_path(assigns(:process_data))
  end

  test "should show process_data" do
    get :show, :id => @process_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @process_data.to_param
    assert_response :success
  end

  test "should update process_data" do
    put :update, :id => @process_data.to_param, :process_data => @process_data.attributes
    assert_redirected_to process_data_path(assigns(:process_data))
  end

  test "should destroy process_data" do
    assert_difference('ProcessData.count', -1) do
      delete :destroy, :id => @process_data.to_param
    end

    assert_redirected_to process_datas_path
  end
end
