require 'test_helper'

class UserprofilesControllerTest < ActionController::TestCase
  setup do
    @userprofile = userprofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userprofile" do
    assert_difference('Userprofile.count') do
      post :create, userprofile: { email_acc1: @userprofile.email_acc1, email_acc2: @userprofile.email_acc2, email_acc3: @userprofile.email_acc3, email_pass1: @userprofile.email_pass1, email_pass2: @userprofile.email_pass2, email_pass3: @userprofile.email_pass3, port1: @userprofile.port1, port2: @userprofile.port2, port3: @userprofile.port3, smtp1: @userprofile.smtp1, smtp2: @userprofile.smtp2, smtp3: @userprofile.smtp3, user_id: @userprofile.user_id }
    end

    assert_redirected_to userprofile_path(assigns(:userprofile))
  end

  test "should show userprofile" do
    get :show, id: @userprofile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userprofile
    assert_response :success
  end

  test "should update userprofile" do
    patch :update, id: @userprofile, userprofile: { email_acc1: @userprofile.email_acc1, email_acc2: @userprofile.email_acc2, email_acc3: @userprofile.email_acc3, email_pass1: @userprofile.email_pass1, email_pass2: @userprofile.email_pass2, email_pass3: @userprofile.email_pass3, port1: @userprofile.port1, port2: @userprofile.port2, port3: @userprofile.port3, smtp1: @userprofile.smtp1, smtp2: @userprofile.smtp2, smtp3: @userprofile.smtp3, user_id: @userprofile.user_id }
    assert_redirected_to userprofile_path(assigns(:userprofile))
  end

  test "should destroy userprofile" do
    assert_difference('Userprofile.count', -1) do
      delete :destroy, id: @userprofile
    end

    assert_redirected_to userprofiles_path
  end
end
