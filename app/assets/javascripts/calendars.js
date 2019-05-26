 function format_calendar_search(d) {
 	

	

	var $html = '<table class="table table-bordered" id="calendar_search_result_table" style="width:100%"> <thead><tr><th>Poznámka</th><th>Začiatok</th><th>Koniec</th></thead><tbody>';
	

	 for ( var i = 0; i < d.length; i++) {
	 	$html+='<td>'+d[i].title+'</td><td class="search_entry_date">'+prettyDateToInput(d[i].start)+'</td><td class="search_entry_date">'+prettyDateToInput(d[i].end)+'</td>';
	 }

	 $html += '</tbody></table>'

	 

	 return $html;
     
    }