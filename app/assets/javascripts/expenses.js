function updateExpenseEditModal(d) {


	
	$('#edit_expense_subject').val(d.about);
	$('#edit_expense_value').val(d.value_no_vat);
    $('#edit_expense_create_date').val(prettyDateToInput(d.expense_date));
    
    

	return false;

}