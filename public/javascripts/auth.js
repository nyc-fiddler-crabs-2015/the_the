
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
      if(jqXHR.status==401){
        $('.error').text('Unmatching Email/password')
      }else if(jqXHR.status==400){
        $('.error').text('Passwords do not match')
      }else if(jqXHR.status==403){
        console.log(jqXHR.status)
        $('.error').text('Invalid Email')
      }else if(jqXHR.status == 500){
        $('.error').text('Email/Username already registered')
      }
    }

  })
}