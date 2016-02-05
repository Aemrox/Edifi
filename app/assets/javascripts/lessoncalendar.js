$(function(){
  console.log("Ready!")
  debugger;
  $('#spinner').fadeOut();
	$('#preloader').delay(300).fadeOut('slow');
	setTimeout(function(){$('.first-slide div:first-child').addClass('fadeInDown');},100);
	setTimeout(function(){$('.first-slide div:last-child').addClass('fadeInRight');},100);
	setTimeout(function(){$('.color-switcher').addClass('slideInLeft');},100);

  $("#calendarModal").on('shown.bs.modal', function () {
    $('#calendar').fullCalendar({
      events: '/lessons/json'
    });
  });

  $('#lesson_button').on('click',function(){
    setTimeout(function(){
      $('#calendar').fullCalendar({
        events: '/lessons/json'
      });
    },1000)
  })
});
