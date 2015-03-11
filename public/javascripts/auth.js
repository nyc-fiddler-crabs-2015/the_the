var renderPartial = function(className){
  var url = $(className).attr('href');
  $.get(url, function(response){
    $('.container').html(response);
  })
};

var errorTemplate = function(message){
  return '<div class="error">%s</div>',[message];
};
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
        $('.container').append(errorTemplate('Unmatching Email/password'))
      }else if(jqXHR.status==400){
        $('.container').append(errorTemplate('Passwords do not match'))
      }
    }

  })
}