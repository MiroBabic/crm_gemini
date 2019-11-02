//= require printThis/printThis.min.js


function updateInvoiceEditModal(d) {


	
	$('#edit_invoice_no').val(d.invoice_no);
	$('#edit_status').val(d.status);
    $('#edit_invoiceprofile').val(d.invoice_profile_id);
    $('#edit_corp_name').val(d.corp_name);
    $('#edit_corp_address').val(d.corp_address);
    $('#edit_corp_address2').val(d.corp_address2);
    $('#edit_contracted_amount').val(d.contracted_amount);
    $('#edit_corp_ico').val(d.corp_ico);
    $('#edit_corp_dic').val(d.corp_dic);
    $('#edit_corp_icdph').val(d.corp_icdph);
    $('#edit_invoice_create_date').val(prettyDateToInput(d.invoice_create_date));
    $('#edit_invoice_due_date').val(prettyDateToInput(d.invoice_due_date));
    $('#edit_delivery_date').val(prettyDateToInput(d.delivery_date));
    

	return false;

}

