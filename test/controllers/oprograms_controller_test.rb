require 'test_helper'

class OprogramsControllerTest < ActionController::TestCase
  setup do
    @oprogram = oprograms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oprograms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oprogram" do
    assert_difference('Oprogram.count') do
      post :create, oprogram: { name: @oprogram.name, note: @oprogram.note }
    end

    assert_redirected_to oprogram_path(assigns(:oprogram))
  end

  test "should show oprogram" do
    get :show, id: @oprogram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oprogram
    assert_response :success
  end

  test "should update oprogram" do
    patch :update, id: @oprogram, oprogram: { name: @oprogram.name, note: @oprogram.note }
    assert_redirected_to oprogram_path(assigns(:oprogram))
  end

  test "should destroy oprogram" do
    assert_difference('Oprogram.count', -1) do
      delete :destroy, id: @oprogram
    end

    assert_redirected_to oprograms_path
  end
end
