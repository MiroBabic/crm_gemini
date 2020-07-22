function updateProcurementEditModal(d) {


	$('#editprocID').val(d.id);
	$('#edit_procurer_name').val(d.procurer_name);
	$('#edit_procurement_name').val(d.name);
    $('#edit_procurement_subject').val(d.subject);
    $('#edit_procurement_anounced_date').val(prettyDateToInput(d.anounced_date));
    $('#edit_procurement_control_date').val(prettyDateToInput(d.control_date));
    $('#edit_procurement_approval_date').val(prettyDateToInput(d.approval_date));
    if (d.approval==true) { $('#edit_procurement_approval').prop('checked', true);} else {$('#edit_procurement_approval').prop('checked', false);}
    $('#edit_procurement_status').val(d.status);
    $('#edit_procurement_note').val(d.note);


	return false;

}
