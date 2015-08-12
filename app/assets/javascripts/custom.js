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

  $('th').click(function(){
      var table = $(this).parents('table').eq(0)
      var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
      this.asc = !this.asc
      if (!this.asc){rows = rows.reverse()}
      for (var i = 0; i < rows.length; i++){table.append(rows[i])}
  })

  function comparer(index) {
      return function(a, b) {
          var valA = getCellValue(a, index), valB = getCellValue(b, index)
          return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.localeCompare(valB)
      }
  }

  function getCellValue(row, index){ return $(row).children('td').eq(index).html() }


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



  // $("#completer").on('click', function(){
  // if (this.checked) {
  //   var completed = true
  // } else {
  //   var completed = false
  // }
  // var checkBox = $(this);
  // $.ajax({
  //   type:'PUT',
  //   url: '/lists/'+ checkBox.data('list-id') + '/tasks/' + checkBox.data('task-id'),
  //   data: { task: { completed: true, title: checkBox.data('task-title') } }
  // })
  // //.done(function(){
  //   // move task to completed table or incompleted table based on completed true or false
  // //})
  //
  // })


  $(".task-status").on('click', function(data) {
    data.preventDefault();
      var currentStatus = $(this).html();
      var taskId        = $(this).data("id");
      var taskStatus    = null

      if (currentStatus === "false"){
        $(this).html("true");
        taskStatus = "true";
        $(this).parent().parent().toggleClass("incomplete complete");
      } else if ($(currentStatus === "true")) {
          $(this).html("false");
          taskStatus = "false";
          $(this).parent().parent().toggleClass("complete incomplete");
      }

      $.ajax({
        type: "PUT",
        url: "/change",
        dataType: "json",
        data:{
          "task_id": taskId,
          "completed": taskStatus
        },
        sucess: function() {
          $(this).removeId(task-table);
          $(this).addId(completed-task-table);
        }
      })
  })


});
