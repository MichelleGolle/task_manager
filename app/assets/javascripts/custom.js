$(document).ready(function(){
  $( "#future-button" ).click(function() {
    $("#future-task-table").toggle();
  });

  $( "#completed-button" ).click(function() {
    $("#completed-task-table").toggle();
  });

  $("#filter").keyup(function(){
      var filter = $(this).val()
      $(".task-title").each(function(){
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
              $(this.parentElement).fadeOut();
          } else {
              $(this).show();
          }
      });
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

});
