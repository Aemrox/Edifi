
$(function(){
  var teacherSkillIndex = []
  $.getJSON( "/teachersjson", function( data ) {
    data.forEach(function(elem){
      teacherSkillIndex.push(elem);
    },this)

  });
  $.getJSON( "/skills", function( data ) {
    data.forEach(function(elem){
      teacherSkillIndex.push(elem);
    },this)
  });

  $('#autocomplete').autocomplete({
     lookup: teacherSkillIndex,
     onSelect: function (suggestion) {
       window.location.href = suggestion.data
     }
   });


})
