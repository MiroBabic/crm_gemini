require 'test_helper'

class MailtemplatesControllerTest < ActionController::TestCase
  setup do
    @mailtemplate = mailtemplates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailtemplates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailtemplate" do
    assert_difference('Mailtemplate.count') do
      post :create, mailtemplate: { content: @mailtemplate.content, name: @mailtemplate.name }
    end

    assert_redirected_to mailtemplate_path(assigns(:mailtemplate))
  end

  test "should show mailtemplate" do
    get :show, id: @mailtemplate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailtemplate
    assert_response :success
  end

  test "should update mailtemplate" do
    patch :update, id: @mailtemplate, mailtemplate: { content: @mailtemplate.content, name: @mailtemplate.name }
    assert_redirected_to mailtemplate_path(assigns(:mailtemplate))
  end

  test "should destroy mailtemplate" do
    assert_difference('Mailtemplate.count', -1) do
      delete :destroy, id: @mailtemplate
    end

    assert_redirected_to mailtemplates_path
  end
end
