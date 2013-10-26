$(function() {
  $('.datepicker').datepicker();
  $('.datepicker').datepicker('option', 'dateFormat', 'yy-mm-dd')

  $('#event_date_start').datepicker('setDate', $('#event_date_start').attr('value'));
  $('#event_date_end').datepicker('setDate', $('#event_date_end').attr('value'));

  $('.timepicker').timepicker();
});
