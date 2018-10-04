require 'test_helper'

class SubjtypesControllerTest < ActionController::TestCase
  setup do
    @subjtype = subjtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subjtype" do
    assert_difference('Subjtype.count') do
      post :create, subjtype: { about: @subjtype.about, name: @subjtype.name }
    end

    assert_redirected_to subjtype_path(assigns(:subjtype))
  end

  test "should show subjtype" do
    get :show, id: @subjtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subjtype
    assert_response :success
  end

  test "should update subjtype" do
    patch :update, id: @subjtype, subjtype: { about: @subjtype.about, name: @subjtype.name }
    assert_redirected_to subjtype_path(assigns(:subjtype))
  end

  test "should destroy subjtype" do
    assert_difference('Subjtype.count', -1) do
      delete :destroy, id: @subjtype
    end

    assert_redirected_to subjtypes_path
  end
end
