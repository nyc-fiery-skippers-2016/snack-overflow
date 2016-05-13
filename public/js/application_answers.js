$(document).ready(function() {

// ajax for vote on question
  $(".answer_box").on('submit', function(event){
    event.preventDefault();
// debugger
  var $target = $(event.target)
  var $url = $target.attr('action')
  var $type = $target.attr('method')

  var ajaxRequest = $.ajax({
    type: $type,
    url: $url,
    data: $target.serialize()git
  });

  ajaxRequest.done(function(response) {
    $("answer_body").append(response);
    $("answer_box").hide();
  });
  });
});
