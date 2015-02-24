require 'test_helper'

class StEndOfLifeDatasControllerTest < ActionController::TestCase
  setup do
    @st_end_of_life_data = st_end_of_life_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_end_of_life_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_end_of_life_data" do
    assert_difference('StEndOfLifeData.count') do
      post :create, :st_end_of_life_data => @st_end_of_life_data.attributes
    end

    assert_redirected_to st_end_of_life_data_path(assigns(:st_end_of_life_data))
  end

  test "should show st_end_of_life_data" do
    get :show, :id => @st_end_of_life_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_end_of_life_data.to_param
    assert_response :success
  end

  test "should update st_end_of_life_data" do
    put :update, :id => @st_end_of_life_data.to_param, :st_end_of_life_data => @st_end_of_life_data.attributes
    assert_redirected_to st_end_of_life_data_path(assigns(:st_end_of_life_data))
  end

  test "should destroy st_end_of_life_data" do
    assert_difference('StEndOfLifeData.count', -1) do
      delete :destroy, :id => @st_end_of_life_data.to_param
    end

    assert_redirected_to st_end_of_life_datas_path
  end
end
