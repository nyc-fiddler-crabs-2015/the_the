var loginValidation = function(className){
  var url = $(className).attr('action');
  var data = $(className).serialize();
  $.ajax({
    url: url,
    type: "post",
    data: data,
    success: function(response){
      window.location.replace(response.location)
    },
    error: function(jqXHR){
      var hey = JSON.parse(jqXHR.responseText)
      $('.error').text(hey.errors)
    }

  })
}