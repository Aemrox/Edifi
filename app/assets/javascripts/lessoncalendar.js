$(function(){
  console.log("Ready!")
  $('#calendar').fullCalendar({
    events: '/lessons/json'
  });
});
