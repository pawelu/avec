$(function(){
  $('.nav a.octicon').on('mouseenter', function(){
    var title = $(this).attr('title');
    $('.nav li.inline-tooltip a').text(title);
  }).on('mouseleave', function(){
    $('.nav li.inline-tooltip a').text('');
  });
})
