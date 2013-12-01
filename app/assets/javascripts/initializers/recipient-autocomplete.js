$(function(){
  $('#message_recipient').autocomplete({
    source: '/users/search.json'
  });
});
