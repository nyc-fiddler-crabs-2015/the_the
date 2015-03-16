var renderPartial = function(className, data){
  var url = $(className).attr(data);
  $.get(url, function(response){
    $('.container_body').html(response);
  })
};

var upVote = function(url){
  $.post(url, function(response){
    if(response.error){
      alert(response.error)
    }else{
      console.log('success')
    }
  })
}