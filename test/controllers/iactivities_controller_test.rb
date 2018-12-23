require 'test_helper'

class IactivitiesControllerTest < ActionController::TestCase
  setup do
    @iactivity = iactivities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iactivities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iactivity" do
    assert_difference('Iactivity.count') do
      post :create, iactivity: { action: @iactivity.action, implementation_id: @iactivity.implementation_id, note: @iactivity.note, user_id: @iactivity.user_id }
    end

    assert_redirected_to iactivity_path(assigns(:iactivity))
  end

  test "should show iactivity" do
    get :show, id: @iactivity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iactivity
    assert_response :success
  end

  test "should update iactivity" do
    patch :update, id: @iactivity, iactivity: { action: @iactivity.action, implementation_id: @iactivity.implementation_id, note: @iactivity.note, user_id: @iactivity.user_id }
    assert_redirected_to iactivity_path(assigns(:iactivity))
  end

  test "should destroy iactivity" do
    assert_difference('Iactivity.count', -1) do
      delete :destroy, id: @iactivity
    end

    assert_redirected_to iactivities_path
  end
end
