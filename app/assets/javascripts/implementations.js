


function updateImplementationEditModal(d) {


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
    $('#edit_nfp_contract_effective').val(prettyDateToInput(d.nfp_contract_effective));
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
    
    $('#edit_procurement').val(d.procurements);
	$('#edit_procurement').trigger("chosen:updated");

	$('#edit_publicity_note').val(d.publicity_note);
	$('#edit_monitoring_note').val(d.monitoring_note);
	$('#edit_change_request_note').val(d.change_request_note);
   


	return false;

}

function formatImplementationDetails(d,procs) {



	$html = '<h3>Projekt</h3><hr>'+
'<p><b>Projekt: </b>'+d.project_name+'</p>'+
'<p><b>Projektový manažér: </b>'+d.project_manager+'</p>'+
'<p><b>Žiadateľ:  </b>'+d.subject_name+'</p>'+
'<p><b>Operačný program: </b>'+d.oprogram+'</p>'+
'<p><b>Kontaktná osoba - Poskytovateľ pomoci: </b>'+d.contact_helper+'</p>'+
'<p><b>Kontaktná osoba - Klient: </b>'+d.contact_client+'</p>'+
'<p><b>Projektant: </b>'+d.projektant+'</p>'+
'<p><b>Auditor: </b>'+d.auditor+'</p>'+
'<p><b>Iné kontaktné osoby: </b>'+d.other_contacts+'</p>'+
'<p><b>Kód žiadosti projektu: </b>'+d.project_request_code+'</p>'+
'<p><b>Stav projektu: </b>'+prettyProjectStatus(d.project_status)+'</p>'+
'<hr><h3>Verejné obstarávanie</h3><hr>';

for (var i=0; i < procs.length; i++) {
	$html+= '<p><b>Verejný obstarávateľ:</b>'+procs[i].procurer_name+'</p>'+
			'<p><b>Názov verejného obstarávania:</b>'+procs[i].name+'</p>'+
			'<p><b>Predmet zákazky:</b>'+procs[i].subject+'</p>'+
			'<p><b>Dátum predloženia na kontrolu:</b>'+prettyDate(procs[i].control_date)+'</p>'+
      		'<p><b>Dátum rozhodnutia o schválení:</b>'+prettyDate(procs[i].approval_date)+'</p>'+
      		'<p><b>Rozhodnutie o schválení:</b>'+getTrueFalseIcon(procs[i].approval)+'</p>'+
      		'<p><b>Stav verejného obstarávania:</b>'+procs[i].status+'</p>'+
      		'<p><b>Poznámka k verejnému obstarávaniu:</b>'+procs[i].note+'</p><hr>'

      
      
      

}

$html+= '<hr><h3>Začatie projektu</h3><hr>'+
'<p><b>Prístup do ITMS - Meno: </b>'+d.itms_access_name+'</p>'+
'<p><b>Prístup do ITMS - Heslo: </b>'+d.itms_access_pass+'</p>'+
'<p><b>Dátum podpisu zmluvy o NFP: </b>'+prettyDate(d.nfp_contract_signed)+'</p>'+
'<p><b>Dátum účinnosti zmluvy o NFP: </b>'+prettyDate(d.nfp_contract_effective)+'</p>'+
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
'<p><b>Nahratie podkladov do ITMS: </b>'+getTrueFalseIcon(d.zop_data_to_itms)+'</p>'+
'<p><b>Nahratie podkladov do ITMS - Stav: </b>'+d.zop_data_to_itms_state+'</p>'+
'<hr><h3>Monitorovanie</h3><hr>'+
'<p><b>Termín najbližšej monitorovačky: </b>'+prettyDate(d.next_monitor_date)+'</p>'+
'<p><b>Termín záverečnej monitorovačky: </b>'+prettyDate(d.finish_monitor_date)+'</p>'+
'<p><b>Dátum predloženia na kontrolu: </b>'+prettyDate(d.control_date)+'</p>'+
'<p><b>Schválenie:  </b>'+getTrueFalseIcon(d.approved)+'</p>'+
'<p><b>Poznámka k monitorovačke: </b>'+d.monitoring_note+'</p>'+
'<hr><h3>Žiadosť o zmenu</h3><hr>'+
'<p><b>Predmet žiadosti: </b>'+d.change_request+'</p>'+
'<p><b>Posledný termín na preloženie žiadosti o zmenu: </b>'+prettyDate(d.change_request_last_term)+'</p>'+
'<p><b>Schválenie žiadosti:  </b>'+getTrueFalseIcon(d.change_request_approval)+'</p>'+
'<p><b>Poznámka k žiadosti: </b>'+d.change_request_note+'</p>'+
'<hr><h3>Povinná publicita</h3><hr>'+
'<p><b>Predmet publicity: </b>'+d.publicity_subject+'</p>'+
'<p><b>Posledný termín na predloženie publicity projektu: </b>'+prettyDate(d.publicity_last_term)+'</p>'+
'<p><b>Dátum predloženia: </b>'+prettyDate(d.publicity_showdate)+'</p>'+
'<p><b>Poznámka k publicite: </b>'+d.publicity_note+'</p>'+
'<hr><h3>Ukončenie projektu</h3><hr>'+
'<p><b>Dátum skutočného ukončenia projektu: </b>'+prettyDate(d.project_real_enddate)+'</p>'+
'<p><b>Spôsob ukončenia projektu: </b>'+d.project_end_type+'</p>'+
'<p><b>Predčasné ukončenie projektu: </b>'+getTrueFalseIcon(d.project_end_sooner)+'</p>'+
'<p><b>Predčasné ukončenie projektu - Termín: </b>'+prettyDate(d.project_end_sooner_date)+'</p>'+
'<p><b>Zaslanie hlásenia o predčasnom ukončení projektu: </b>'+getTrueFalseIcon(d.note_project_sooner_sent)+'</p>'+
'<p><b>Zaslanie hlásenia o predčasnom ukončení projektu - Termín: </b>'+prettyDate(d.note_project_sooner_sent_date)+'</p>';

	 
	 return $html;
     
    }


function formatImplementationNotes(d,impl_id) {
	
	$html = '<h3>Poznámky <a id="addimplnote" data-toggle="modal" data-target="#addImplemNoteModal"><i id="impl_id_'+impl_id+'" class="fa fa-plus-circle" aria-hidden="true"></i></a> </h3><hr>'
	
	 for ( var i = 0; i < d.length; i++) {
	 	$html+= '<p><b>Dátum vloženia: </b>' +prettyDate(d[i].created_at)+'</p><p><b>Poznámka: </b>'+d[i].note+' <a class="del_implem_note"><i id="del_impl_note_'+d[i].id+'" class="fa fa-trash-o" aria-hidden="true"></i></a></p><hr>';
      
     }

     
	 return $html;

};

