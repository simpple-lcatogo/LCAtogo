require 'test_helper'

class RecyclingEndOfLivesControllerTest < ActionController::TestCase
  setup do
    @recycling_end_of_life = recycling_end_of_lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recycling_end_of_lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recycling_end_of_life" do
    assert_difference('RecyclingEndOfLife.count') do
      post :create, :recycling_end_of_life => @recycling_end_of_life.attributes
    end

    assert_redirected_to recycling_end_of_life_path(assigns(:recycling_end_of_life))
  end

  test "should show recycling_end_of_life" do
    get :show, :id => @recycling_end_of_life.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @recycling_end_of_life.to_param
    assert_response :success
  end

  test "should update recycling_end_of_life" do
    put :update, :id => @recycling_end_of_life.to_param, :recycling_end_of_life => @recycling_end_of_life.attributes
    assert_redirected_to recycling_end_of_life_path(assigns(:recycling_end_of_life))
  end

  test "should destroy recycling_end_of_life" do
    assert_difference('RecyclingEndOfLife.count', -1) do
      delete :destroy, :id => @recycling_end_of_life.to_param
    end

    assert_redirected_to recycling_end_of_lives_path
  end
end
