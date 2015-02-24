require 'test_helper'

class DataQualitiesControllerTest < ActionController::TestCase
  setup do
    @data_quality = data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_quality" do
    assert_difference('DataQuality.count') do
      post :create, :data_quality => @data_quality.attributes
    end

    assert_redirected_to data_quality_path(assigns(:data_quality))
  end

  test "should show data_quality" do
    get :show, :id => @data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @data_quality.to_param
    assert_response :success
  end

  test "should update data_quality" do
    put :update, :id => @data_quality.to_param, :data_quality => @data_quality.attributes
    assert_redirected_to data_quality_path(assigns(:data_quality))
  end

  test "should destroy data_quality" do
    assert_difference('DataQuality.count', -1) do
      delete :destroy, :id => @data_quality.to_param
    end

    assert_redirected_to data_qualities_path
  end
end
