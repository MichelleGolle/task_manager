$(document).ready(function(){

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
