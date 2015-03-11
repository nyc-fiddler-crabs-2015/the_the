
var loginValidation = function(className){
  console.log('here')
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
      console.log("failure")
      if(jqXHR.status==401){
        $('.error').text('Unmatching Email/password')
      }else if(jqXHR.status==400){
        $('.error').text('Passwords do not match')
      }
    }

  })
}