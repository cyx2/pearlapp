require 'test_helper'

class CornellsubjectsControllerTest < ActionController::TestCase
  setup do
    @cornellsubject = cornellsubjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cornellsubjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cornellsubject" do
    assert_difference('Cornellsubject.count') do
      post :create, cornellsubject: { prefix: @cornellsubject.prefix }
    end

    assert_redirected_to cornellsubject_path(assigns(:cornellsubject))
  end

  test "should show cornellsubject" do
    get :show, id: @cornellsubject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cornellsubject
    assert_response :success
  end

  test "should update cornellsubject" do
    patch :update, id: @cornellsubject, cornellsubject: { prefix: @cornellsubject.prefix }
    assert_redirected_to cornellsubject_path(assigns(:cornellsubject))
  end

  test "should destroy cornellsubject" do
    assert_difference('Cornellsubject.count', -1) do
      delete :destroy, id: @cornellsubject
    end

    assert_redirected_to cornellsubjects_path
  end
end
