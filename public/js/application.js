$(document).ready(function() {
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
