require 'test_helper'

class CornellClassesControllerTest < ActionController::TestCase
  setup do
    @cornell_class = cornell_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cornell_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cornell_class" do
    assert_difference('CornellClass.count') do
      post :create, cornell_class: { avgrating: @cornell_class.avgrating, created_at: @cornell_class.created_at, number: @cornell_class.number, numratings: @cornell_class.numratings, subject: @cornell_class.subject, title: @cornell_class.title, updated_at: @cornell_class.updated_at }
    end

    assert_redirected_to cornell_class_path(assigns(:cornell_class))
  end

  test "should show cornell_class" do
    get :show, id: @cornell_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cornell_class
    assert_response :success
  end

  test "should update cornell_class" do
    patch :update, id: @cornell_class, cornell_class: { avgrating: @cornell_class.avgrating, created_at: @cornell_class.created_at, number: @cornell_class.number, numratings: @cornell_class.numratings, subject: @cornell_class.subject, title: @cornell_class.title, updated_at: @cornell_class.updated_at }
    assert_redirected_to cornell_class_path(assigns(:cornell_class))
  end

  test "should destroy cornell_class" do
    assert_difference('CornellClass.count', -1) do
      delete :destroy, id: @cornell_class
    end

    assert_redirected_to cornell_classes_path
  end
end
