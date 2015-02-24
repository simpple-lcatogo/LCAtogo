require 'test_helper'

class SeRecyclingDatasControllerTest < ActionController::TestCase
  setup do
    @se_recycling_data = se_recycling_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_recycling_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_recycling_data" do
    assert_difference('SeRecyclingData.count') do
      post :create, :se_recycling_data => @se_recycling_data.attributes
    end

    assert_redirected_to se_recycling_data_path(assigns(:se_recycling_data))
  end

  test "should show se_recycling_data" do
    get :show, :id => @se_recycling_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_recycling_data.to_param
    assert_response :success
  end

  test "should update se_recycling_data" do
    put :update, :id => @se_recycling_data.to_param, :se_recycling_data => @se_recycling_data.attributes
    assert_redirected_to se_recycling_data_path(assigns(:se_recycling_data))
  end

  test "should destroy se_recycling_data" do
    assert_difference('SeRecyclingData.count', -1) do
      delete :destroy, :id => @se_recycling_data.to_param
    end

    assert_redirected_to se_recycling_datas_path
  end
end
