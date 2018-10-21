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
      '</p><p><b>Poznámka: </b>'+d[i].personnote+'</p><p><b>Dátum vloženia: </b>'+prettyDate(d[i].created_at)+
      '</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d[i].updated_at)+'</p><hr>';
	 }

	 
	 var $return = $part1.concat($part2);

	 return $return;
     
    }

 function formatSubjCommunicationsDetail(d) {

	var $part2 ='';
	var $part1 = '<h3>Zoznam komunikácie so subjektom</h3>';

	 for ( var i = 0; i < d.length; i++) {
	 	$part2+= '<p><b>S osobou: </b>' +d[i].first_name+' '+d[i].last_name+'</p><p><b>Vytvoril: </b>'+d[i].email+'</p><p><b>Kľúčové slovo: </b>'+d[i].keyword+
      '</p><p><b>Obash: </b>'+d[i].about+'</p><p><b>Dátum vloženia: </b>'+prettyDate(d[i].created_at)+
      '</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d[i].updated_at)+'</p><hr>';
	 }

	 
	 var $return = $part1.concat($part2);

	 return $return;
     
    }

function updateSubjEditModal(d) {
	$('#editsubjektID').val(d.id);
	$('#edit_subjname').val(d.name);
	$('#edit_subjsite').val(d.site);
	$('#edit_subjico').val(d.ico);
	$('#edit_subjnote').val(d.note);
	$('#edit_subjdistrict').val(d.district_id);
	$('#edit_subjtype').val(d.subjtype_id);
	$('#edit_subjobyv').val(d.citizen_count);
	
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
