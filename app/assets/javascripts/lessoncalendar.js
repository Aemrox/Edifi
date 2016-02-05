$(function(){
  console.log("Ready!")

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
