require 'test_helper'

class PcDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @pc_data_quality = pc_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pc_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc_data_quality" do
    assert_difference('PcDataQuality.count') do
      post :create, :pc_data_quality => @pc_data_quality.attributes
    end

    assert_redirected_to pc_data_quality_path(assigns(:pc_data_quality))
  end

  test "should show pc_data_quality" do
    get :show, :id => @pc_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pc_data_quality.to_param
    assert_response :success
  end

  test "should update pc_data_quality" do
    put :update, :id => @pc_data_quality.to_param, :pc_data_quality => @pc_data_quality.attributes
    assert_redirected_to pc_data_quality_path(assigns(:pc_data_quality))
  end

  test "should destroy pc_data_quality" do
    assert_difference('PcDataQuality.count', -1) do
      delete :destroy, :id => @pc_data_quality.to_param
    end

    assert_redirected_to pc_data_qualities_path
  end
end
