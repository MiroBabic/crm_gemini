// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks


//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require dataTables/datatables.min.js
//= require dataTables/dataTables.checkboxes.min.js
//= require pdfmake/pdfmake.min.js
//= require pdfmake/vfs_fonts.js
//= require jszip/jszip.min.js
//= require multiselect/multiselect.min.js

//= require peity/jquery.peity.min.js

//= require inspinia.js

//= require fullcalendar/moment.min.js
//= require fullcalendar/fullcalendar.min.js
//= require fullcalendar/sk.js

//= require_tree .


function prettyDate(dd) {
var monthNames = [
  "Január", "Február", "Marec",
  "Apríl", "Máj", "Jún", "Júl",
  "August", "September", "Október",
  "November", "December"
];

var date = new Date(dd);

var day = date.getDate();
var monthIndex = date.getMonth();
var year = date.getFullYear();
var hour = date.getHours();
var minute = date.getMinutes();

if (hour < 10)  hour = '0'+hour;
if (minute < 10)  minute = '0'+minute;

if (dd !== null )

return(day + ' ' + monthNames[monthIndex] + ' ' + year +'  '+ hour+':'+minute);

else return 'Neexistuje';

}

function prettyProjectStatus(status) {

  $res = status;

  if (status == 'in_progress') {$res = 'realizácia projektu'}
  if (status == 'project_done') {$res = 'ukončenie projektu'}
  if (status == 'nfp_approved') {$res = 'schválená zmluva o NFP'}

    return $res;
}

function prettyDateToInput(dd) {
	

if (dd !== null ) {
	myDate = dd.split("T")[0]

return(myDate);
}

else return '';

}

function prettyTimeToInput(dd) {
  

if (dd !== null ) {
  mytime = dd.split("T")[1]

return(mytime);
}

else return '';

}

function getTrueFalseIcon(data) {
	if (data==true) {$res = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';}
	else if(data==false)	{$res = '<i class="fa fa-window-close-o fa-2x" aria-hidden="true"></i>';}
	else {$res = 'Nezistené';}

	return $res;
}

  function flashMessageFromAjax(status,msg) {
    var $statuscolor
    if (status=="ok") {$statuscolor="alert alert-info"}
      else {$statuscolor = "alert alert-danger"}

        $myhtml ='<div class="'+$statuscolor+' fade in"><a href="#" data-dismiss="alert" class="close">×</a>'+ msg +'</div>'

    return $myhtml;
}

function get_activity_icon(action_type) {

  
 
  $res = ''

  switch (action_type) {
      case 'implemenation_create':
        $res = '<i class="fa fa-plus-circle" aria-hidden="true"></i>';
        break;
      case 'implemenation_update':
        $res = '<i class="fa fa-puzzle-piece" aria-hidden="true"></i>';
        break;
      case 'document_upload':
        $res = '<i class="fa fa-files-o" aria-hidden="true"></i>';
        break;
      case 'procurement_change':
        $res = '<i class="fa fa-university" aria-hidden="true"></i>';
        break;
      case 'invoice':
        $res = '<i class="fa fa-eur" aria-hidden="true"></i>';
        break;
      case 'implementation_change':
        $res = '<i class="fa fa-indent" aria-hidden="true"></i>';
        break;
     default:
        $res = ''
    }

    return $res;
  }


//set navigation

function setNavigation() {
   var path = window.location.pathname;
   path = path[0] == '/' ? path.substr(0) : path; //it will remove the dash in the URL

   $("ul.metismenu a").each(function() {
       var href = $(this).attr('href');
       if (path.substring(0, href.length) === href) {
           $(this).closest('li').addClass('active');
       }
   });

   $("ul.metismenu .nav-second-level a").each(function() {
       var href = $(this).attr('href');
       if (path.substring(0, href.length) === href) {
           $(this).parent().parent().closest('li').addClass('active');
           $(this).closest('ul').addClass('in');
       }
   });
}

//end of set navigation
     

document.addEventListener("turbolinks:load", function() {
  $('#side-menu').metisMenu({toggle: false });
  setNavigation();
});
