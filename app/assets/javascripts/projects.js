

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
	
}


function updateImplementationEditModal(d) {

	$('#editimplementationID').val(d.id);
	$('#edit_subject_new').val(d.subject_id);
	$('#edit_project_manager').val(d.user_id);
	$('#edit_oprogram').val(d.oprogram);
	$('#edit_contact_helper').val(d.contact_helper);
	$('#edit_contact_client').val(d.contact_client);
	$('#edit_projektant').val(d.projektant);
	$('#edit_procurer_name').val(d.procurer_name);
	$('#edit_auditor').val(d.auditor);
    $('#edit_other_contacts').val(d.other_contacts);
	$('#edit_itms_access_name').val(d.itms_access_name);
	$('#edit_itms_access_pass').val(d.itms_access_pass);
    $('#edit_nfp_contract_signed').val(d.nfp_contract_signed);
    $('#edit_project_startdate').val(d.project_startdate);
	$('#edit_project_start_about').val(d.project_start_about);
	$('#edit_project_end_about').val(d.project_end_about);
	if (d.project_start_note_sent==true) { $('#edit_project_start_note_sent').prop('checked', true);} else {$('#edit_project_start_note_sent').prop('checked', false);}
	$('#edit_project_start_note_sentdate').val(d.project_start_note_sentdate);
	$('#edit_project_enddate_by_nfp_contract').val(d.project_enddate_by_nfp_contract);
	if (d.project_schedule_change_need==true) { $('#edit_project_schedule_change_need').prop('checked', true);} else {$('#edit_project_schedule_change_need').prop('checked', false);}
	$('#edit_schedule_change_need_date').val(d.schedule_change_need_date);
	$('#edit_zop_showdate').val(d.zop_showdate);
	$('#edit_zop_last_term_end').val(d.zop_last_term_end);
	$('#edit_zop_last_term_start').val(d.zop_last_term_start);
	$('#edit_zop_note').val(d.zop_note);
	$('#edit_zop_last_showdate').val(d.zop_last_showdate);
	$('#edit_zop_request_type').val(d.zop_request_type);
	if (d.zop_paycond_fulfil==true) { $('#edit_zop_paycond_fulfil').prop('checked', true);} else {$('#edit_zop_paycond_fulfil').prop('checked', false);}
	if (d.zop_cond_fulfil==true) { $('#edit_zop_cond_fulfil').prop('checked', true);} else {$('#edit_zop_cond_fulfil').prop('checked', false);}
	if (d.zop_data_to_itms==true) { $('#edit_zop_data_to_itms').prop('checked', true);} else {$('#edit_zop_data_to_itms').prop('checked', false);}
	$('#edit_zop_data_to_itms_state').val(d.zop_data_to_itms_state);
	$('#edit_zop_state').val(d.zop_state);
	$('#edit_next_monitor_date').val(d.next_monitor_date);
	$('#edit_finish_monitor_date').val(d.finish_monitor_date);
	$('#edit_control_date').val(d.control_date);
	if (d.approved==true) { $('#edit_approved').prop('checked', true);} else {$('#edit_approved').prop('checked', false);}
	$('#edit_publicity_subject').val(d.publicity_subject);
	$('#edit_publicity_last_term').val(d.publicity_last_term);
	$('#edit_publicity_showdate').val(d.publicity_showdate);
	$('#edit_project_end_type').val(d.project_end_type);
	if (d.project_end_sooner==true) { $('#edit_project_end_sooner').prop('checked', true);} else {$('#edit_project_end_sooner').prop('checked', false);}
	$('#edit_project_end_sooner_date').val(d.project_end_sooner_date);
	if (d.note_project_sooner_sent==true) { $('#edit_note_project_sooner_sent').prop('checked', true);} else {$('#edit_note_project_sooner_sent').prop('checked', false);}
	$('#edit_note_project_sooner_sent_date').val(d.note_project_sooner_sent_date);

}