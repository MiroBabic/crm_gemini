

$(document).ready(function() {
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();


$('#mycalendar:not(".fc-event")').on('contextmenu', function (e) {
e.preventDefault()
});

var calendar =	$("#calendar").fullCalendar({
editable: true,
height: 550,
eventLimit: true, // allow "more" link when too many events
header: {
left: "prev,next today",
center: "title",
right: "month,agendaWeek,agendaDay"
},
events: "events.php",
// Convert the allDay from string to boolean
eventRender: function(event, element, view) {
if (event.allDay === "true") {
event.allDay = true;
} else {
event.allDay = false;
}
},
selectable: true,
selectHelper: true,
select: function(start, end, allDay) {
var title = prompt("Poznámka:");
var url = prompt("url k danej poznámke, ak existuje a je potrebná:");
if (title) {


var start=moment(start).format("YYYY/MM/DD HH:mm:ss");
var end=moment(end).format("YYYY/MM/DD HH:mm:ss");

var a = new Date(start);
var b = new Date(end);
var diffDays = b.getTime() - a.getTime(); 



$.ajax({
url: "add_events.php",
data: "title="+ title+"&start="+ start +"&end="+ end +"&url="+ url + "&allDay="+ diffDays ,
type: "POST",
success: function(json) {
alert("záznam pridaný");
calendar.fullCalendar( 'refetchEvents' );
}
});
calendar.fullCalendar("renderEvent",
{
title: title,
start: start,
end: end,
allDay: allDay
},
true // make the event "stick"
);
}
calendar.fullCalendar("unselect");
},

editable: true,
eventDrop: function(event, delta) {

var start=moment(event.start).format("YYYY/MM/DD HH:mm:ss");
var end=moment(event.end).format("YYYY/MM/DD HH:mm:ss");


$.ajax({
url: "edit_events.php",
data: "title="+ event.title+"&start="+ start +"&end="+ end +"&id="+ event.id ,
type: "POST",
success: function(json) {
alert("Záznam upravený");
}
});
},
eventResize: function(event) {
var start=moment(event.start).format("YYYY/MM/DD HH:mm:ss");
var end=moment(event.end).format("YYYY/MM/DD HH:mm:ss");
$.ajax({
url: "edit_events.php",
data: "title="+ event.title+"&start="+ start +"&end="+ end +"&id="+ event.id ,
type: "POST",
success: function(json) {
alert("Záznam upravený");
calendar.fullCalendar( 'refetchEvents' );
}
});

},
eventRender: function (event, element) {
element.bind('mousedown', function (e) {
if (e.which == 3) {

var x = confirm("Naozaj chceš vymazať tento záznam v kalendári?");
if (x) {
$.ajax({
url: "remove_events.php",
data: "&id="+ event.id ,
type: "POST",
success: function(json) {
alert("Záznam vymazaný");
}
})
.done(function (msg) {
calendar.fullCalendar( 'refetchEvents' );

});

}
//  
else
return false;


}
});
},

eventClick:  function(event, jsEvent, view) {

$('#modalTitle').html(event.title);
$('#modalBody').html(event.description);
$('#eventUrl').attr('href',event.url);
$('#calendarModal').modal();
}




});

});


