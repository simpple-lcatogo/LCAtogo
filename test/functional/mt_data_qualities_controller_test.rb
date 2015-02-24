require 'test_helper'

class MtDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @mt_data_quality = mt_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_data_quality" do
    assert_difference('MtDataQuality.count') do
      post :create, :mt_data_quality => @mt_data_quality.attributes
    end

    assert_redirected_to mt_data_quality_path(assigns(:mt_data_quality))
  end

  test "should show mt_data_quality" do
    get :show, :id => @mt_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_data_quality.to_param
    assert_response :success
  end

  test "should update mt_data_quality" do
    put :update, :id => @mt_data_quality.to_param, :mt_data_quality => @mt_data_quality.attributes
    assert_redirected_to mt_data_quality_path(assigns(:mt_data_quality))
  end

  test "should destroy mt_data_quality" do
    assert_difference('MtDataQuality.count', -1) do
      delete :destroy, :id => @mt_data_quality.to_param
    end

    assert_redirected_to mt_data_qualities_path
  end
end
