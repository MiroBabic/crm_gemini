function updateCommEditModal(d) {
	$('#editcommID').val(d.id);
	//$('#editcommsubject').val(d.subject_id);
	$('#editcommabout').val(d.about);
	$('#editcommkeyword').val(d.keyword);
	$('#subject_edit_id_for_person').val(d.subject_id)
	$('#editcommsubject').append('<option selected val="'+d.subject_id+'">'+d.subject_name+'</option>')
	$('.chosen-select').trigger("chosen:updated");
}


