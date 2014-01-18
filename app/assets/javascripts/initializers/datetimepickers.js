$(function() {
  function setDateTime(){
    var date = $('#date_start').val();
    var time = $('#time_start').val();
    $('#event_datetime_start').val(date + ' ' + time);
  }

  $('#date_start').datepicker({
    minDate: 0,
    maxDate: "+3Y",
    dateFormat: 'yy-mm-dd',
    onSelect: function(datetext, inst){
      var date = $.datepicker.formatDate( "d M yy", new Date(datetext), {
        dayNamesShort: $.datepicker.regional[ "pl" ].dayNamesShort,
        dayNames: $.datepicker.regional[ "pl" ].dayNames,
        monthNamesShort: $.datepicker.regional[ "pl" ].monthNamesShort,
        monthNames: $.datepicker.regional[ "pl" ].monthNames
      });

      $('#day').text(date);
      setDateTime();
    }
  });

  var date_start = $('#date_start').attr('value');
  $('#date_start').datepicker('setDate', date_start);

  $('.glyphicon.glyphicon-calendar').on('click', function(){
    $('#date_start').datepicker('show');
  });

  $('#time_start').timepicker({
    showPeriodLabels: false,
    hourText: 'Godzina',
    minuteText: 'Minuta',
    onSelect: function(timetext, inst){
      $('#time').text(timetext);
      setDateTime();
    }
  });

  $('.glyphicon.glyphicon-time').on('click', function(){
    $('#time_start').timepicker('show');
  });
});
