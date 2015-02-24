require 'test_helper'

class PhDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @ph_data_quality = ph_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_data_quality" do
    assert_difference('PhDataQuality.count') do
      post :create, :ph_data_quality => @ph_data_quality.attributes
    end

    assert_redirected_to ph_data_quality_path(assigns(:ph_data_quality))
  end

  test "should show ph_data_quality" do
    get :show, :id => @ph_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_data_quality.to_param
    assert_response :success
  end

  test "should update ph_data_quality" do
    put :update, :id => @ph_data_quality.to_param, :ph_data_quality => @ph_data_quality.attributes
    assert_redirected_to ph_data_quality_path(assigns(:ph_data_quality))
  end

  test "should destroy ph_data_quality" do
    assert_difference('PhDataQuality.count', -1) do
      delete :destroy, :id => @ph_data_quality.to_param
    end

    assert_redirected_to ph_data_qualities_path
  end
end
