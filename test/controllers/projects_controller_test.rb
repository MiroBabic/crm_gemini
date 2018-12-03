require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { contract: @project.contract, contractor: @project.contractor, control_zonfp: @project.control_zonfp, due_date: @project.due_date, note: @project.note, order: @project.order, payed: @project.payed, payment: @project.payment, person_id: @project.person_id, sent_to_sign: @project.sent_to_sign, submit_online: @project.submit_online, submit_print: @project.submit_print, user_id: @project.user_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { contract: @project.contract, contractor: @project.contractor, control_zonfp: @project.control_zonfp, due_date: @project.due_date, note: @project.note, order: @project.order, payed: @project.payed, payment: @project.payment, person_id: @project.person_id, sent_to_sign: @project.sent_to_sign, submit_online: @project.submit_online, submit_print: @project.submit_print, user_id: @project.user_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
