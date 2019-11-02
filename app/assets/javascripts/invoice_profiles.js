function updateInvProfileEditModal(d) {


	
	$('#edit_name').val(d.name);
	$('#edit_address1').val(d.address1);
    $('#edit_address2').val(d.address2);
    $('#edit_ico').val(d.ico);
    $('#edit_dic').val(d.dic);
    $('#edit_icdph').val(d.icdph);
    $('#edit_bank_name').val(d.bank_name);
    $('#edit_iban').val(d.iban);
    $('#edit_orsr_entry').val(d.orsr_entry)
        

	return false;

}

