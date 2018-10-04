require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post :create, subject: { city_id: @subject.city_id, ico: @subject.ico, name: @subject.name, note: @subject.note, site: @subject.site, subjtype_id: @subject.subjtype_id, web: @subject.web, zaujimavost: @subject.zaujimavost }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should show subject" do
    get :show, id: @subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject
    assert_response :success
  end

  test "should update subject" do
    patch :update, id: @subject, subject: { city_id: @subject.city_id, ico: @subject.ico, name: @subject.name, note: @subject.note, site: @subject.site, subjtype_id: @subject.subjtype_id, web: @subject.web, zaujimavost: @subject.zaujimavost }
    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete :destroy, id: @subject
    end

    assert_redirected_to subjects_path
  end
end
