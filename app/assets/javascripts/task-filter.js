$(document).ready(function(){
  $( "#future-button" ).click(function() {
    $("#future-task-table").toggle();
  });

  $( "#completed-button" ).click(function() {
    $("#completed-task-table").toggle();
  });

  $("#title-filter").keyup(function(){
      var filter = $(this).val()
      if (filter == "") {
        $(".task-title").each(function(){
          $(this.parentElement).fadeIn();
        });
      } else {
        $(".task-title").each(function(){
          if ($(this).text().search(new RegExp(filter, "i")) < 0) {
              $(this.parentElement).fadeOut();
          } else {
              $(this).show();
          }
        });
      }
  });

  $("#start-date-filter").keyup(function(){
      var filter = $(this).val()
      if (filter == "") {
        $(".start-date").each(function(){
          $(this.parentElement).fadeIn();
        });
      } else {
        $(".start-date").each(function(){
          if ($(this).text().search(new RegExp(filter, "i")) < 0) {
              $(this.parentElement).fadeOut();
          } else {
              $(this).show();
          }
        });
      }
  });

  $("#due-date-filter").keyup(function(){
      var filter = $(this).val()
      if (filter == "") {
        $(".due-date").each(function(){
          $(this.parentElement).fadeIn();
        });
      } else {
        $(".due-date").each(function(){
          if ($(this).text().search(new RegExp(filter, "i")) < 0) {
              $(this.parentElement).fadeOut();
          } else {
              $(this).show();
          }
        });
      }
  });

  $('.tag-button').click(function() {
    var filter = $(this).text();
    if (filter === "all") {
      $(".task-tags").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
      $(".task-tags").each(function(){
        if ($(this).text().indexOf(filter) > -1) {
          $(this).show();
        } else {
          $(this.parentElement).fadeOut();
        }
      });
    }
  });
});
