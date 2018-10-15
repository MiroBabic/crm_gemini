function updateTemplateEditModal(d) {
	$('#edittemplateID').val(d.id);
	$('#nazov_temp_edit').val(d.name);
	$('#template_content_edit').summernote('code',d.content);
		
}