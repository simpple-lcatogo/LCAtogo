require 'test_helper'

class StEndOfLivesControllerTest < ActionController::TestCase
  setup do
    @st_end_of_life = st_end_of_lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_end_of_lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_end_of_life" do
    assert_difference('StEndOfLife.count') do
      post :create, :st_end_of_life => @st_end_of_life.attributes
    end

    assert_redirected_to st_end_of_life_path(assigns(:st_end_of_life))
  end

  test "should show st_end_of_life" do
    get :show, :id => @st_end_of_life.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_end_of_life.to_param
    assert_response :success
  end

  test "should update st_end_of_life" do
    put :update, :id => @st_end_of_life.to_param, :st_end_of_life => @st_end_of_life.attributes
    assert_redirected_to st_end_of_life_path(assigns(:st_end_of_life))
  end

  test "should destroy st_end_of_life" do
    assert_difference('StEndOfLife.count', -1) do
      delete :destroy, :id => @st_end_of_life.to_param
    end

    assert_redirected_to st_end_of_lives_path
  end
end
