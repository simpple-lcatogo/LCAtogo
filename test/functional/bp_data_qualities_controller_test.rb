require 'test_helper'

class BpDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @bp_data_quality = bp_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_data_quality" do
    assert_difference('BpDataQuality.count') do
      post :create, :bp_data_quality => @bp_data_quality.attributes
    end

    assert_redirected_to bp_data_quality_path(assigns(:bp_data_quality))
  end

  test "should show bp_data_quality" do
    get :show, :id => @bp_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_data_quality.to_param
    assert_response :success
  end

  test "should update bp_data_quality" do
    put :update, :id => @bp_data_quality.to_param, :bp_data_quality => @bp_data_quality.attributes
    assert_redirected_to bp_data_quality_path(assigns(:bp_data_quality))
  end

  test "should destroy bp_data_quality" do
    assert_difference('BpDataQuality.count', -1) do
      delete :destroy, :id => @bp_data_quality.to_param
    end

    assert_redirected_to bp_data_qualities_path
  end
end
