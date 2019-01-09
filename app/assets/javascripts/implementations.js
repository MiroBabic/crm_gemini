


function updateImplementationEditModal(d) {



	$('#editimplementationID').val(d.id);
	$('#edit_subject_new').val(d.subject_id);
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

	return false;

}

function formatImplementationDetails(d) {

	$html = '<h3>Projekt</h3><hr>'+
'<p><b>Projekt: </b>'+d.project_name+'</p>'+
'<p><b>Projektový manažér: </b>'+d.project_manager+'</p>'+
'<p><b>Žiadateľ:  </b>'+d.subject_name+'</p>'+
'<p><b>Operačný program: </b>'+d.oprogram+'</p>'+
'<p><b>Kontaktná osoba - Poskytovateľ pomoci: </b>'+d.contact_helper+'</p>'+
'<p><b>Kontaktná osoba - Klient: </b>'+d.contact_client+'</p>'+
'<p><b>Projektant: </b>'+d.projektant+'</p>'+
'<p><b>Verejný obstarávateľ: </b>'+d.procurer_name+'</p>'+
'<p><b>Auditor: </b>'+d.auditor+'</p>'+
'<p><b>Iné kontaktné osoby: </b>'+d.other_contacts+'</p>'+
'<hr><h3>Začatie projektu</h3><hr>'+
'<p><b>Prístup do ITMS - Meno: </b>'+d.itms_access_name+'</p>'+
'<p><b>Prístup do ITMS - Heslo: </b>'+d.itms_access_pass+'</p>'+
'<p><b>Dátum podpisu a účinnosti zmluvy o NFP: </b>'+prettyDate(d.nfp_contract_signed)+'</p>'+
'<p><b>Dátum začatia projektu: </b>'+prettyDate(d.project_startdate)+'</p>'+
'<p><b>Čím sa projekt začína: </b>'+d.project_start_about+'</p>'+
'<p><b>Čím sa projekt končí: </b>'+d.project_end_about+'</p>'+
'<p><b>Zaslanie hlásenia o začatí projektu:  </b>'+getTrueFalseIcon(d.project_start_note_sent)+'</p>'+
'<p><b>Zaslanie hlásenia o začatí projektu - Termín:  </b>'+prettyDate(d.project_start_note_sentdate)+'</p>'+
'<p><b>Termín ukončenia projektu podľa zmluvy o NFP: </b>'+prettyDate(d.project_enddate_by_nfp_contract)+'</p>'+
'<p><b>Potreba zmeny harmonogramu projektu:  </b>'+getTrueFalseIcon(d.project_schedule_change_need)+'</p>'+
'<p><b>Potreba zmeny harmonogramu projektu - Termín:  </b>'+prettyDate(d.schedule_change_need_date)+'</p>'+
'<hr><h3>ŽOP</h3><hr>'+
'<p><b>Dátum predloženia ŽOP: </b>'+prettyDate(d.zop_showdate)+'</p>'+
'<p><b>Posledný termín na predloženie ŽOP záverečná: </b>'+prettyDate(d.zop_last_term_end)+'</p>'+
'<p><b>Posledný termín na predloženie prvej ŽOP: </b>'+prettyDate(d.zop_last_term_start)+'</p>'+
'<p><b>Poznámka k ŽOP: </b>'+d.zop_note+'</p>'+
'<p><b>Dátum predloženia poslednej ŽOP: </b>'+prettyDate(d.zop_last_showdate)+'</p>'+
'<p><b>Typ žiadosti: </b>'+d.zop_request_type+'</p>'+
'<p><b>Stav ŽOP: </b>'+d.zop_state+'</p>'+
'<p><b>Splnené podmienky na úhradu ŽOP: </b>'+getTrueFalseIcon(d.zop_paycond_fulfil)+'</p>'+
'<p><b>Splnené náležitosti ŽOP: </b>'+getTrueFalseIcon(d.zop_cond_fulfil)+'</p>'+
'<p><b>Nahratie predkladov do ITMS: </b>'+getTrueFalseIcon(d.zop_data_to_itms)+'</p>'+
'<p><b>Nahratie predkladov do ITMS - Stav: </b>'+d.zop_data_to_itms_state+'</p>'+
'<hr><h3>Monitorovanie</h3><hr>'+
'<p><b>Termín najbližšej monitorovačky: </b>'+prettyDate(d.next_monitor_date)+'</p>'+
'<p><b>Termín záverečnej monitorovačky: </b>'+prettyDate(d.finish_monitor_date)+'</p>'+
'<p><b>Dátum predloženia na kontrolu: </b>'+prettyDate(d.control_date)+'</p>'+
'<p><b>Schválenie:  </b>'+getTrueFalseIcon(d.approved)+'</p>'+
'<hr><h3>Povinná publicita</h3><hr>'+
'<p><b>Predmet publicity: </b>'+d.publicity_subject+'</p>'+
'<p><b>Posledný termín na predloženie publicity projektu: </b>'+prettyDate(d.publicity_last_term)+'</p>'+
'<p><b>Dátum predloženia: </b>'+prettyDate(d.publicity_showdate)+'</p>'+
'<hr><h3>Ukončenie projektu</h3><hr>'+
'<p><b>Spôsob ukončenia projektu: </b>'+d.project_end_type+'</p>'+
'<p><b>Predčasné ukončenie projektu: </b>'+getTrueFalseIcon(d.project_end_sooner)+'</p>'+
'<p><b>Predčasné ukončenie projektu - Termín: </b>'+prettyDate(d.project_end_sooner_date)+'</p>'+
'<p><b>Zaslanie hlásenia o predčasnom ukončení projektu: </b>'+getTrueFalseIcon(d.note_project_sooner_sent)+'</p>'+
'<p><b>Zaslanie hlásenia o predčasnom ukončení projektu - Termín: </b>'+prettyDate(d.note_project_sooner_sent_date)+'</p>';

	 
	 return $html;
     
    }


