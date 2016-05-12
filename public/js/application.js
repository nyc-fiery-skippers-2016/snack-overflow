$(document).ready(function() {
  $(".votes").on('submit', 'up-vote', function(event) {
    event.preventDefault();

    var $target = $(event.target);
    var $votes = $target.parents('aside').find('.vote-count');
    var request = $.ajax({
      url: $target.attr('action'),
      method: 'post',
      data: $target.serialize()
    });
      request.done(function(response){
      $votes.text(response);
    });
      request.fail(function(){
      alert("Code failed.");
    });
});