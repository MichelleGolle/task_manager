$(document).ready(function(){
  $( "#future-button" ).click(function() {
    $("#future-task-table").toggle();
  });

  $( "#completed-button" ).click(function() {
    $("#completed-task-table").toggle();
  });
});
