require 'test_helper'

class CornellclassesControllerTest < ActionController::TestCase
  setup do
    @cornellclass = cornellclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cornellclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cornellclass" do
    assert_difference('Cornellclass.count') do
      post :create, cornellclass: { avgrating: @cornellclass.avgrating, courseid: @cornellclass.courseid, coursenumber: @cornellclass.coursenumber, created_at: @cornellclass.created_at, numratings: @cornellclass.numratings, prefix: @cornellclass.prefix, title: @cornellclass.title, updated_at: @cornellclass.updated_at }
    end

    assert_redirected_to cornellclass_path(assigns(:cornellclass))
  end

  test "should show cornellclass" do
    get :show, id: @cornellclass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cornellclass
    assert_response :success
  end

  test "should update cornellclass" do
    patch :update, id: @cornellclass, cornellclass: { avgrating: @cornellclass.avgrating, courseid: @cornellclass.courseid, coursenumber: @cornellclass.coursenumber, created_at: @cornellclass.created_at, numratings: @cornellclass.numratings, prefix: @cornellclass.prefix, title: @cornellclass.title, updated_at: @cornellclass.updated_at }
    assert_redirected_to cornellclass_path(assigns(:cornellclass))
  end

  test "should destroy cornellclass" do
    assert_difference('Cornellclass.count', -1) do
      delete :destroy, id: @cornellclass
    end

    assert_redirected_to cornellclasses_path
  end
end
