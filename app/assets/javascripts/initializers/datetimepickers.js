$(function() {
  var date_start = $('#date_start').attr('value');

  $('.datepicker').datepicker({
    onSelect: function(datetext, inst){
      var date = $.datepicker.formatDate( "d M yy", new Date(datetext), {
        dayNamesShort: $.datepicker.regional[ "pl" ].dayNamesShort,
        dayNames: $.datepicker.regional[ "pl" ].dayNames,
        monthNamesShort: $.datepicker.regional[ "pl" ].monthNamesShort,
        monthNames: $.datepicker.regional[ "pl" ].monthNames
      });

      $('#day').text(date);
    }
  });
  $('.datepicker').datepicker('option', 'dateFormat', 'yy-mm-dd')

  $('#date_start').datepicker('setDate', date_start);

  $('.glyphicon.glyphicon-calendar').on('click', function(){
    $('#date_start').datepicker('show');
  });
});

$(function() {
  $('.timepicker').timepicker({
    onSelect: function(timetext, inst){
      $('#time').text(timetext);
    }
  });

  $('.glyphicon.glyphicon-time').on('click', function(){
    $('#time_start').timepicker('show');
  });
});
