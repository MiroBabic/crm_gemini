//= require jquery-fileupload/jquery.iframe-transport.js
//= require jquery-fileupload/jquery.fileupload.js
//= require jquery-fileupload/jquery.fileupload-process.js
//= require jquery-fileupload/bootstrap-filestyle.min.js

function showNoAccess(d) {
	return '<p>Sem nemáš prístup</p>';
}

function formatSubjDetail(d) {
      return '<p><b>Sídlo: </b>' +d.site+'</p><p><b>IČO: </b>'+d.ico+'</p><p><b>Poznámka: </b>'+d.note+'</p><p><b>Web: </b>'+d.web+
      '</p><p><b>Dátum vloženia: </b>'+prettyDate(d.created_at)+'</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d.updated_at)+
      '</p><p><b>Popis typu subjektu: </b>'+d.subjtype_about+'</p>';
    }

function formatSubjContactsDetail(d) {

	var $part2 ='';
	var $part1 = '<h3>Zoznam kontaktov ku subjektu</h3>';

	 for ( var i = 0; i < d.length; i++) {
	 	$part2+= '<p><b>Meno: </b>' +d[i].first_name+'</p><p><b>Priezvisko: </b>'+d[i].last_name+'</p><p><b>Email: </b>'+d[i].email+
      '</p><p><b>Email2: </b>'+d[i].email2+'</p><p><b>Telefón: </b>'+d[i].phone+'</p><p><b>Mobil: </b>'+d[i].cellphone+
      '</p><p><b>Poznámka: </b>'+d[i].note+'</p><p><b>Dátum vloženia: </b>'+prettyDate(d[i].created_at)+
      '</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d[i].updated_at)+'</p>'+
      '<button class="editsubjectcontactbtn btn btn-success" id="editsubjectcontactbtn'+d[i].id+'" type="button" >Uprav tento kontakt</button><hr>';
     
	 }

	 
	 var $return = $part1.concat($part2);

	 return $return;
     
    }

 function formatSubjCommunicationsDetail(d,subject_id) {
 	

	var $part2 ='';

	var $part1 = '<h3>Zoznam komunikácie so subjektom  <a id="add_communication" data-toggle="modal" data-target="#addCommunicationModal"><i id="subject_id_'+subject_id+'" class="fa fa-plus-circle" aria-hidden="true"></i></a></h3>';
	

	 for ( var i = 0; i < d.length; i++) {
	 	$part2+= '<span id="commdetail'+d[i].id+'"><p><b>S osobou: </b>' +d[i].first_name+' '+d[i].last_name+'</p><p><b>Vytvoril: </b>'+d[i].email+'</p><p><b>Kľúčové slovo: </b>'+d[i].keyword+
      '</p><p><b>Obash: </b>'+d[i].about+'</p><p><b>Dátum vloženia: </b>'+prettyDate(d[i].created_at)+
      '</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d[i].updated_at)+'</p><a class="del_implem_note"><i id="del_comm_'+d[i].id+'" class="fa fa-trash-o" aria-hidden="true"></i></a><hr></span>';
	 }

	 
	 var $return = $part1.concat($part2);

	 return $return;
     
    }

function updateSubjEditModal(d) {

	$('#editsubjektID').val(d.subject_id);
	$('#edit_subjname').val(d.subject_name);
	$('#edit_spravuje').val(d.user_id);
	$('#edit_subjsite').val(d.site);
	$('#edit_subjico').val(d.ico);
	$('#edit_subjnote').val(d.note);
	if (d.vip==true) { $('#edit_isvip').prop('checked', true);} else {$('#edit_isvip').prop('checked', false);}
	$('#edit_subjdistrict').val(d.district_id);
	$('#edit_subjtype').val(d.subjtype_id);
	$('#edit_subjobyv').val(d.citizen_count);

	
	$('#project_targets_edit').val(d.project_targets);
	$('#project_targets_edit').trigger("chosen:updated");
	
}



function updatePersonEditModal(d) {
	$('#editpersonID').val(d.id);
	$('#edit_personname').val(d.first_name);
	$('#edit_personsurname').val(d.last_name);
	$('#edit_email').val(d.email);
	$('#edit_email2').val(d.email2);
	$('#edit_tel').val(d.phone);
	$('#edit_cell').val(d.cellphone);
	$('#edit_personnote').val(d.note);
	$('#edit_personsubject').val(d.subject_id);
	
}
