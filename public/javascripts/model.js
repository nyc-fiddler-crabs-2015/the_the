var renderPartial = function(className, data){
  var url = $(className).attr(data);
  $.get(url, function(response){
    $('.container_body').html(response);
  })
};
