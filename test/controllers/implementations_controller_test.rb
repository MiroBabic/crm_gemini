require 'test_helper'

class ImplementationsControllerTest < ActionController::TestCase
  setup do
    @implementation = implementations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:implementations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create implementation" do
    assert_difference('Implementation.count') do
      post :create, implementation: { approved: @implementation.approved, auditor: @implementation.auditor, contact_client: @implementation.contact_client, contact_helper: @implementation.contact_helper, control_date: @implementation.control_date, finish_monitor_date: @implementation.finish_monitor_date, itms_access_name: @implementation.itms_access_name, itms_access_pass: @implementation.itms_access_pass, next_monitor_date: @implementation.next_monitor_date, nfp_contract_signed: @implementation.nfp_contract_signed, note_project_sonner_sent: @implementation.note_project_sonner_sent, note_project_sooner_sent_date: @implementation.note_project_sooner_sent_date, oprogram: @implementation.oprogram, other_contacts: @implementation.other_contacts, procurer_name: @implementation.procurer_name, project_end_sooner: @implementation.project_end_sooner, project_end_sooner_date: @implementation.project_end_sooner_date, project_end_type: @implementation.project_end_type, project_enddate_by_nfp_contract: @implementation.project_enddate_by_nfp_contract, project_id: @implementation.project_id, project_schedule_change_need: @implementation.project_schedule_change_need, project_start_about: @implementation.project_start_about, project_start_note_sent: @implementation.project_start_note_sent, project_start_note_sentdate: @implementation.project_start_note_sentdate, project_startdate: @implementation.project_startdate, projektant: @implementation.projektant, publicity_last_term: @implementation.publicity_last_term, publicity_showdate: @implementation.publicity_showdate, publicity_subject: @implementation.publicity_subject, subject_id: @implementation.subject_id, user_id: @implementation.user_id, zop_cond_fulfil: @implementation.zop_cond_fulfil, zop_data_to_itms: @implementation.zop_data_to_itms, zop_data_to_itms_state: @implementation.zop_data_to_itms_state, zop_last_showdate: @implementation.zop_last_showdate, zop_last_term_end: @implementation.zop_last_term_end, zop_last_term_start: @implementation.zop_last_term_start, zop_note: @implementation.zop_note, zop_paycond_fulfil: @implementation.zop_paycond_fulfil, zop_request_type: @implementation.zop_request_type, zop_showdate: @implementation.zop_showdate }
    end

    assert_redirected_to implementation_path(assigns(:implementation))
  end

  test "should show implementation" do
    get :show, id: @implementation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @implementation
    assert_response :success
  end

  test "should update implementation" do
    patch :update, id: @implementation, implementation: { approved: @implementation.approved, auditor: @implementation.auditor, contact_client: @implementation.contact_client, contact_helper: @implementation.contact_helper, control_date: @implementation.control_date, finish_monitor_date: @implementation.finish_monitor_date, itms_access_name: @implementation.itms_access_name, itms_access_pass: @implementation.itms_access_pass, next_monitor_date: @implementation.next_monitor_date, nfp_contract_signed: @implementation.nfp_contract_signed, note_project_sonner_sent: @implementation.note_project_sonner_sent, note_project_sooner_sent_date: @implementation.note_project_sooner_sent_date, oprogram: @implementation.oprogram, other_contacts: @implementation.other_contacts, procurer_name: @implementation.procurer_name, project_end_sooner: @implementation.project_end_sooner, project_end_sooner_date: @implementation.project_end_sooner_date, project_end_type: @implementation.project_end_type, project_enddate_by_nfp_contract: @implementation.project_enddate_by_nfp_contract, project_id: @implementation.project_id, project_schedule_change_need: @implementation.project_schedule_change_need, project_start_about: @implementation.project_start_about, project_start_note_sent: @implementation.project_start_note_sent, project_start_note_sentdate: @implementation.project_start_note_sentdate, project_startdate: @implementation.project_startdate, projektant: @implementation.projektant, publicity_last_term: @implementation.publicity_last_term, publicity_showdate: @implementation.publicity_showdate, publicity_subject: @implementation.publicity_subject, subject_id: @implementation.subject_id, user_id: @implementation.user_id, zop_cond_fulfil: @implementation.zop_cond_fulfil, zop_data_to_itms: @implementation.zop_data_to_itms, zop_data_to_itms_state: @implementation.zop_data_to_itms_state, zop_last_showdate: @implementation.zop_last_showdate, zop_last_term_end: @implementation.zop_last_term_end, zop_last_term_start: @implementation.zop_last_term_start, zop_note: @implementation.zop_note, zop_paycond_fulfil: @implementation.zop_paycond_fulfil, zop_request_type: @implementation.zop_request_type, zop_showdate: @implementation.zop_showdate }
    assert_redirected_to implementation_path(assigns(:implementation))
  end

  test "should destroy implementation" do
    assert_difference('Implementation.count', -1) do
      delete :destroy, id: @implementation
    end

    assert_redirected_to implementations_path
  end
end
