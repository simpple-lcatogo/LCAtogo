require 'test_helper'

class MtAssessmentsControllerTest < ActionController::TestCase
  setup do
    @mt_assessment = mt_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_assessment" do
    assert_difference('MtAssessment.count') do
      post :create, :mt_assessment => @mt_assessment.attributes
    end

    assert_redirected_to mt_assessment_path(assigns(:mt_assessment))
  end

  test "should show mt_assessment" do
    get :show, :id => @mt_assessment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_assessment.to_param
    assert_response :success
  end

  test "should update mt_assessment" do
    put :update, :id => @mt_assessment.to_param, :mt_assessment => @mt_assessment.attributes
    assert_redirected_to mt_assessment_path(assigns(:mt_assessment))
  end

  test "should destroy mt_assessment" do
    assert_difference('MtAssessment.count', -1) do
      delete :destroy, :id => @mt_assessment.to_param
    end

    assert_redirected_to mt_assessments_path
  end
end
