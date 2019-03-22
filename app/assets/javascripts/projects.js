
function formatProjectfinance(d) {

	 if (d.payed == true) {$res='<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>'}
      else {$res='<i class="fa fa-window-close-o fa-2x" aria-hidden="true"></i>'}
    

	 return '<p><b>Dohodnuté odmeny: </b>' +d.agreed_payment+'</p><p><b>Fakturovaná odmena: </b>'+d.payment+'</p><p><b>Splatnosť: </b>'+d.due_date+'</p><p><b>Uhradené: </b>'+$res+
      '</p>';
     
    }

function updateProjectEditModal(d) {

	$('#editprojectID').val(d.id);
	$('#project_name_edit').val(d.name);
	$('#subject_edit').val(d.subject_id);
	$('#project_manager_edit').val(d.user_id);
	$('#contract_edit').val(d.contract);
	$('#order_edit').val(d.order);
	$('#project_note_edit').val(d.note);
	$('#control_zonfp_edit').val(d.control_zonfp);
	$('#project_contractor_edit').val(d.contractor);
	if (d.sent_to_sign==true) { $('#sent_sign_edit').prop('checked', true);} else {$('#sent_sign_edit').prop('checked', false);}
	if (d.submit_online==true) { $('#submitonline_edit').prop('checked', true);} else {$('#submitonline_edit').prop('checked', false);}
	if (d.submit_print==true) { $('#submitprint_edit').prop('checked', true);} else {$('#submitprint_edit').prop('checked', false);}
	$('#agreed_pay_edit').val(d.agreed_payment);
	$('#pay_edit').val(d.payment);
	$('#duedate_edit').val(d.due_date);
	if (d.payed==true) { $('#payed_edit').prop('checked', true);} else {$('#payed_edit').prop('checked', false);}

	$('#subject_edit').trigger('chosen:updated');
	
}


function updateImplementationEditModalProject(d) {

	
	$('#editimplementationID').val(d.id);
	
	$('#edit_project_manager').val(d.user_id);
	$('#edit_oprogram_new').val(d.oprogram_id);
	$('#edit_contact_helper').val(d.contact_helper);
	$('#edit_contact_client').val(d.contact_client);
	$('#edit_projektant').val(d.projektant);
	$('#edit_procurer_name').val(d.procurer_name);
	$('#edit_auditor').val(d.auditor);
    $('#edit_other_contacts').val(d.other_contacts);
	$('#edit_itms_access_name').val(d.itms_access_name);
	$('#edit_itms_access_pass').val(d.itms_access_pass);
    $('#edit_nfp_contract_signed').val(prettyDateToInput(d.nfp_contract_signed));
    $('#edit_project_startdate').val(prettyDateToInput(d.project_startdate));
	$('#edit_project_start_about').val(d.project_start_about);
	$('#edit_project_end_about').val(d.project_end_about);
	if (d.project_start_note_sent==true) { $('#edit_project_start_note_sent').prop('checked', true);} else {$('#edit_project_start_note_sent').prop('checked', false);}
	$('#edit_project_start_note_sentdate').val(prettyDateToInput(d.project_start_note_sentdate));
	$('#edit_project_enddate_by_nfp_contract').val(prettyDateToInput(d.project_enddate_by_nfp_contract));
	if (d.project_schedule_change_need==true) { $('#edit_project_schedule_change_need').prop('checked', true);} else {$('#edit_project_schedule_change_need').prop('checked', false);}
	$('#edit_schedule_change_need_date').val(prettyDateToInput(d.schedule_change_need_date));
	$('#edit_zop_showdate').val(prettyDateToInput(d.zop_showdate));
	$('#edit_zop_last_term_end').val(prettyDateToInput(d.zop_last_term_end));
	$('#edit_zop_last_term_start').val(prettyDateToInput(d.zop_last_term_start));
	$('#edit_zop_note').val(d.zop_note);
	$('#edit_zop_last_showdate').val(prettyDateToInput(d.zop_last_showdate));
	$('#edit_zop_request_type').val(d.zop_request_type);
	if (d.zop_paycond_fulfil==true) { $('#edit_zop_paycond_fulfil').prop('checked', true);} else {$('#edit_zop_paycond_fulfil').prop('checked', false);}
	if (d.zop_cond_fulfil==true) { $('#edit_zop_cond_fulfil').prop('checked', true);} else {$('#edit_zop_cond_fulfil').prop('checked', false);}
	if (d.zop_data_to_itms==true) { $('#edit_zop_data_to_itms').prop('checked', true);} else {$('#edit_zop_data_to_itms').prop('checked', false);}
	$('#edit_zop_data_to_itms_state').val(d.zop_data_to_itms_state);
	$('#edit_zop_state').val(d.zop_state);
	$('#edit_next_monitor_date').val(prettyDateToInput(d.next_monitor_date));
	$('#edit_finish_monitor_date').val(prettyDateToInput(d.finish_monitor_date));
	$('#edit_control_date').val(prettyDateToInput(d.control_date));
	if (d.approved==true) { $('#edit_approved').prop('checked', true);} else {$('#edit_approved').prop('checked', false);}
	$('#edit_publicity_subject').val(d.publicity_subject);
	$('#edit_publicity_last_term').val(prettyDateToInput(d.publicity_last_term));
	$('#edit_publicity_showdate').val(prettyDateToInput(d.publicity_showdate));
	$('#edit_project_end_type').val(d.project_end_type);
	if (d.project_end_sooner==true) { $('#edit_project_end_sooner').prop('checked', true);} else {$('#edit_project_end_sooner').prop('checked', false);}
	$('#edit_project_end_sooner_date').val(prettyDateToInput(d.project_end_sooner_date));
	if (d.note_project_sooner_sent==true) { $('#edit_note_project_sooner_sent').prop('checked', true);} else {$('#edit_note_project_sooner_sent').prop('checked', false);}
	$('#edit_note_project_sooner_sent_date').val(prettyDateToInput(d.note_project_sooner_sent_date));
	$('#edit_project_real_enddate').val(prettyDateToInput(d.project_real_enddate));
	$('#edit_change_request_last_term').val(prettyDateToInput(d.change_request_last_term));
	$('#edit_change_request').val(d.change_request);
	if (d.change_request_approval==true) { $('#edit_change_request_approval').prop('checked', true);} else {$('#edit_change_request_approval').prop('checked', false);}

	$('#edit_project_request_code').val(d.project_request_code);
    $('#edit_project_status').val(d.project_status);
    $('#edit_procurement_name').val(d.procurement_name);
    $('#edit_procurement_subject').val(d.procurement_subject);
    $('#edit_procurement_control_date').val(prettyDateToInput(d.procurement_control_date));
    $('#edit_procurement_approval_date').val(prettyDateToInput(d.procurement_approval_date));
    if (d.procurement_approval==true) { $('#edit_procurement_approval').prop('checked', true);} else {$('#edit_procurement_approval').prop('checked', false);}
    $('#edit_procurement_status').val(d.procurement_status);
    $('#edit_procurement_note').val(d.procurement_note);

}

