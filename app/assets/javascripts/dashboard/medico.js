jQuery(document).ready(function() {
	
	
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	var h = date.getHours();
	var eventos = [];
	function adicionaEvento(){
		var evento = new Object(); 
		var titulo = $(this).find('span.titulo').html();
		var inicio = new Date($(this).find('span.inicio').html());
		evento.title = titulo;
		evento.start = inicio;
		evento.allDay = false;
		eventos.push(evento);
	}
	
	$('.evento').each(adicionaEvento);
	
	
	$('div#agendaDia').fullCalendar({
		theme: false,
		defaultView:'agendaDay',
		allDaySlot:false,
		minTime:h,
		maxTime:h+6,
		events: eventos
	});

//	$('div#agendaDia').fullCalendar({
//		theme: false,
//		defaultView:'agendaWeek',
//		allDaySlot:true,
//		minTime:8,
//		maxTime:18,
//		events: 
//			[
//				{
//					title: 'All Day Event',
//					start: new Date(y, m, 1)
//				},
//				{
//					title: 'Long Event',
//					start: new Date(y, m, d-5),
//					end: new Date(y, m, d-2)
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: new Date(y, m, d-3, 16, 0),
//					allDay: false
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: new Date(y, m, d+4, 16, 0),
//					allDay: false
//				},
//				{
//					title: 'Meeting',
//					start: new Date(y, m, d, 10, 30),
//					allDay: false
//				},
//				{
//					title: 'Lunch',
//					start: new Date(y, m, d, 12, 0),
//					end: new Date(y, m, d, 14, 0),
//					allDay: false
//				},
//				{
//					title: 'Birthday Party',
//					start: new Date(y, m, d+1, 19, 0),
//					end: new Date(y, m, d+1, 22, 30),
//					allDay: false
//				},
//				{
//					title: 'Click for Google',
//					start: new Date(y, m, 28),
//					end: new Date(y, m, 29),
//					url: 'http://google.com/'
//				}
//			]
//	});
//	
//	$('div#agendaMes').fullCalendar({
//		header: {
//			left: 'prev,next today',
//			center: 'title',
//		}, 
//		minTime:8,
//		maxTime:18,
//		events: 
//			[
//				{
//					title: 'All Day Event',
//					start: new Date(y, m, 1)
//				},
//				{
//					title: 'Long Event',
//					start: new Date(y, m, d-5),
//					end: new Date(y, m, d-2)
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: new Date(y, m, d-3, 16, 0),
//					allDay: false
//				},
//				{
//					id: 999,
//					title: 'Repeating Event',
//					start: new Date(y, m, d+4, 16, 0),
//					allDay: false
//				},
//				{
//					title: 'Meeting',
//					start: new Date(y, m, d, 10, 30),
//					allDay: false
//				},
//				{
//					title: 'Lunch',
//					start: new Date(y, m, d, 12, 0),
//					end: new Date(y, m, d, 14, 0),
//					allDay: false
//				},
//				{
//					title: 'Birthday Party',
//					start: new Date(y, m, d+1, 19, 0),
//					end: new Date(y, m, d+1, 22, 30),
//					allDay: false
//				},
//				{
//					title: 'Click for Google',
//					start: new Date(y, m, 28),
//					end: new Date(y, m, 29),
//					url: 'http://google.com/'
//				}
//			]
//	});
//	
//	
//	$('#calendar').fullCalendar({
//		theme: true,
//		header: {
//		left: 'prev,next today',
//		center: 'title',
//		right: 'month,agendaWeek,agendaDay'
//	},
//		editable: true,
//		events: 
//		[
//			{
//				title: 'All Day Event',
//				start: new Date(y, m, 1)
//			},
//			{
//				title: 'Long Event',
//				start: new Date(y, m, d-5),
//				end: new Date(y, m, d-2)
//			},
//			{
//				id: 999,
//				title: 'Repeating Event',
//				start: new Date(y, m, d-3, 16, 0),
//				allDay: false
//			},
//			{
//				id: 999,
//				title: 'Repeating Event',
//				start: new Date(y, m, d+4, 16, 0),
//				allDay: false
//			},
//			{
//				title: 'Meeting',
//				start: new Date(y, m, d, 10, 30),
//				allDay: false
//			},
//			{
//				title: 'Lunch',
//				start: new Date(y, m, d, 12, 0),
//				end: new Date(y, m, d, 14, 0),
//				allDay: false
//			},
//			{
//				title: 'Birthday Party',
//				start: new Date(y, m, d+1, 19, 0),
//				end: new Date(y, m, d+1, 22, 30),
//				allDay: false
//			},
//			{
//				title: 'Click for Google',
//				start: new Date(y, m, 28),
//				end: new Date(y, m, 29),
//				url: 'http://google.com/'
//			}
//		]
//	}); 
	
	
	
})