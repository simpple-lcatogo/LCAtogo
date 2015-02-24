require 'test_helper'

class MtEndOfLivesControllerTest < ActionController::TestCase
  setup do
    @mt_end_of_life = mt_end_of_lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_end_of_lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_end_of_life" do
    assert_difference('MtEndOfLife.count') do
      post :create, :mt_end_of_life => @mt_end_of_life.attributes
    end

    assert_redirected_to mt_end_of_life_path(assigns(:mt_end_of_life))
  end

  test "should show mt_end_of_life" do
    get :show, :id => @mt_end_of_life.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_end_of_life.to_param
    assert_response :success
  end

  test "should update mt_end_of_life" do
    put :update, :id => @mt_end_of_life.to_param, :mt_end_of_life => @mt_end_of_life.attributes
    assert_redirected_to mt_end_of_life_path(assigns(:mt_end_of_life))
  end

  test "should destroy mt_end_of_life" do
    assert_difference('MtEndOfLife.count', -1) do
      delete :destroy, :id => @mt_end_of_life.to_param
    end

    assert_redirected_to mt_end_of_lives_path
  end
end
