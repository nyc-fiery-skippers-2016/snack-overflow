$(document).ready(function() {

// ajax for vote on question
  $("#up-vote").on('submit', function(event){
    event.preventDefault();

    var $target = $(event.target);
    var $votes = $target.parents('aside').find('.vote-count');
    var request = $.ajax({
      url: $target.attr('action'),
      method: 'post',
      data: $target.serialize()
    });
      request.done(function(response){
      // $votes.text(response);
      $('#number').replaceWith($(response).find('.vote-count').text());
      // $(response).find('.vote-count').text();

    });
      request.fail(function(){
      alert("Nice Try.");
    });
});

  $("#down-vote").on('submit', function(event){
    event.preventDefault();

    var $target = $(event.target);
    var $votes = $target.parents('aside').find('.vote-count');
    var request = $.ajax({
      url: $target.attr('action'),
      method: 'post',
      data: $target.serialize()
    });
      request.done(function(response){
      // $votes.text(response);
      $('#number').replaceWith($(response).find('.vote-count').text());
      // $(response).find('.vote-count').text();

    });
      request.fail(function(){
      alert("Code failed.");
    });
});

// ajax for comment
  $("#question-comment-link").on("click", function(event){
    event.preventDefault();

    var $target = $(event.target)

    requestOptions = {
      url: $target.attr("href")
    }

    $.ajax(requestOptions).done(function(response){
        $("#question-comment-form-holder").append(response);
        $("#question-comment-link").hide();
    });
  });

  $("#question-comment-form-holder").on("submit", "#question-comment-form", function(event){
    event.preventDefault();

    var $target = $(event.target)

    requestOptions = {
      url: $target.attr("action"),
      method: $target.attr("method"),
      data: $target.serialize()
    }

    $.ajax(requestOptions).done(function(response){
      $("#question-comment-list").append(response);
      $("#question-comment-form-holder").empty();
      $("#question-comment-link").show();
    });
  });
 });