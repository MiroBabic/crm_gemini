function formatSubjDetail(d) {
      return '<p><b>Sídlo: </b>' +d.site+'</p><p><b>IČO: </b>'+d.ico+'</p><p><b>Poznámka: </b>'+d.note+'</p><p><b>Web: </b>'+d.web+'</p><p><b>Dátum vloženia: </b>'+prettyDate(d.created_at)+'</p><p><b>Dátum poslednej zmeny: </b>'+prettyDate(d.updated_at)+'</p><p><b>Popis typu subjektu: </b>'+d.subjtype_about+'</p>';
    }

function updateSubjEditModal(d) {
	$('#editsubjektID').val(d.id);
	$('#edit_subjname').val(d.name);
	$('#edit_subjsite').val(d.site);
	$('#edit_subjico').val(d.ico);
	$('#edit_subjnote').val(d.note);
	$('#edit_subjdistrict').val(d.district_id);
	$('#edit_subjtype').val(d.subjtype_id);
	
}