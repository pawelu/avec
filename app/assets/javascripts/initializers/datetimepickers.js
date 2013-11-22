$(function() {

  $('.datepicker').datepicker({
    onSelect: function(datetext, inst){
      var date = $.datepicker.formatDate( "d M yy", new Date(datetext), {
        dayNamesShort: $.datepicker.regional[ "pl" ].dayNamesShort,
        dayNames: $.datepicker.regional[ "pl" ].dayNames,
        monthNamesShort: $.datepicker.regional[ "pl" ].monthNamesShort,
        monthNames: $.datepicker.regional[ "pl" ].monthNames
      });

      $('#day').text(date);

      var date = $('#date_start').val();
      var time = $('#time_start').val();
      $('#event_datetime_start').val(date + ' ' + time);
    }
  });
  $('.datepicker').datepicker('option', 'dateFormat', 'yy-mm-dd')

  var date_start = $('#date_start').attr('value');
  $('#date_start').datepicker('setDate', date_start);

  $('.glyphicon.glyphicon-calendar').on('click', function(){
    $('#date_start').datepicker('show');
  });
});

$(function() {
  $('.timepicker').timepicker({
    onSelect: function(timetext, inst){
      $('#time').text(timetext);

      var date = $('#date_start').val();
      var time = $('#time_start').val();
      $('#event_datetime_start').val(date + ' ' + time);
    }
  });

  $('.glyphicon.glyphicon-time').on('click', function(){
    $('#time_start').timepicker('show');
  });
});
