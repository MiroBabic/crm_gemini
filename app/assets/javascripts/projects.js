

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


