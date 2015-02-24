require 'test_helper'

class ReuseEndOfLivesControllerTest < ActionController::TestCase
  setup do
    @reuse_end_of_life = reuse_end_of_lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reuse_end_of_lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reuse_end_of_life" do
    assert_difference('ReuseEndOfLife.count') do
      post :create, :reuse_end_of_life => @reuse_end_of_life.attributes
    end

    assert_redirected_to reuse_end_of_life_path(assigns(:reuse_end_of_life))
  end

  test "should show reuse_end_of_life" do
    get :show, :id => @reuse_end_of_life.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reuse_end_of_life.to_param
    assert_response :success
  end

  test "should update reuse_end_of_life" do
    put :update, :id => @reuse_end_of_life.to_param, :reuse_end_of_life => @reuse_end_of_life.attributes
    assert_redirected_to reuse_end_of_life_path(assigns(:reuse_end_of_life))
  end

  test "should destroy reuse_end_of_life" do
    assert_difference('ReuseEndOfLife.count', -1) do
      delete :destroy, :id => @reuse_end_of_life.to_param
    end

    assert_redirected_to reuse_end_of_lives_path
  end
end
