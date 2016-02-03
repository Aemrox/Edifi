$(function(){
  console.log("Ready!")
  $('#calendar').fullCalendar({
    events: '/lessons/json'
  });

  $('#lesson_button').on('click',function(){
    setTimeout(function(){
      $('#calendar').fullCalendar({
        events: '/lessons/json'
      });
    },1000)
  })
});
