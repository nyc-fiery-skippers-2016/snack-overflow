$(document).ready(function() {
  $("#answer-comment-link").on("click", function(event){
    event.preventDefault();

    var $target = $(event.target)

    requetsOptions = {
      url: $target.attr("href")
    }

    $.ajax(requetsOptions).done(function(response){
      $("#answer-comment-form-holder").append(response);
      $("#answer-comment-link").hide();
    });
  });  

  $("#answer-comment-form-holder").on("submit", "#answer-comment-form", function(event){
    event.preventDefault();

    var $target = $(event.target)

    requestOptions = {
      url: $target.attr("action"),
      method: $target.attr("method"),
      data: $target.serialize()
    }

    $.ajax(requestOptions).done(function(response){
      $("#answer-comment-list").append(response);
      $("#answer-comment-form-holder").empty();
      $("#answer-comment-link").show();
    });
  });
});