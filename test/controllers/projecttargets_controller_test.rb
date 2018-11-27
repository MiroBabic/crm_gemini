require 'test_helper'

class ProjecttargetsControllerTest < ActionController::TestCase
  setup do
    @projecttarget = projecttargets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projecttargets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projecttarget" do
    assert_difference('Projecttarget.count') do
      post :create, projecttarget: { name: @projecttarget.name }
    end

    assert_redirected_to projecttarget_path(assigns(:projecttarget))
  end

  test "should show projecttarget" do
    get :show, id: @projecttarget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projecttarget
    assert_response :success
  end

  test "should update projecttarget" do
    patch :update, id: @projecttarget, projecttarget: { name: @projecttarget.name }
    assert_redirected_to projecttarget_path(assigns(:projecttarget))
  end

  test "should destroy projecttarget" do
    assert_difference('Projecttarget.count', -1) do
      delete :destroy, id: @projecttarget
    end

    assert_redirected_to projecttargets_path
  end
end
