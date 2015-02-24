require 'test_helper'

class StDataQualitiesControllerTest < ActionController::TestCase
  setup do
    @st_data_quality = st_data_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_data_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_data_quality" do
    assert_difference('StDataQuality.count') do
      post :create, :st_data_quality => @st_data_quality.attributes
    end

    assert_redirected_to st_data_quality_path(assigns(:st_data_quality))
  end

  test "should show st_data_quality" do
    get :show, :id => @st_data_quality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_data_quality.to_param
    assert_response :success
  end

  test "should update st_data_quality" do
    put :update, :id => @st_data_quality.to_param, :st_data_quality => @st_data_quality.attributes
    assert_redirected_to st_data_quality_path(assigns(:st_data_quality))
  end

  test "should destroy st_data_quality" do
    assert_difference('StDataQuality.count', -1) do
      delete :destroy, :id => @st_data_quality.to_param
    end

    assert_redirected_to st_data_qualities_path
  end
end
