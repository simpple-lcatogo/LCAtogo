require 'test_helper'

class SeDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @se_data_quality = se_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_data_quality" do
    assert_difference('SeDataQuality.count') do
      post :create, :se_data_quality => @se_data_quality.attributes
    end

    assert_redirected_to se_data_quality_path(assigns(:se_data_quality))
  end

  test "should show se_data_quality" do
    get :show, :id => @se_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_data_quality.to_param
    assert_response :success
  end

  test "should update se_data_quality" do
    put :update, :id => @se_data_quality.to_param, :se_data_quality => @se_data_quality.attributes
    assert_redirected_to se_data_quality_path(assigns(:se_data_quality))
  end

  test "should destroy se_data_quality" do
    assert_difference('SeDataQuality.count', -1) do
      delete :destroy, :id => @se_data_quality.to_param
    end

    assert_redirected_to se_data_qualities_path
  end
end
