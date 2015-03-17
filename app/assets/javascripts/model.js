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

var songObject = function(params){
  this.title = params.title;
  this.url = params.url;
  this.id = params.id;
}

songObject.prototype.htmlSong = function(what){
  var hey = '<div class="song"><h3><a href=/songs/'+ this.id+'>'+ this.title +'</a></h3><div class="soundcloud"><iframe width="100%" height="35px" scrolling="no" frameborder="no" src="'+this.url+'"></iframe></div></div>'
  return hey;

  }

songObject.prototype.show = function(what){
  $('.container_body').append(this.htmlSong(what))
}

var renderJSON = function(event){
  var $target = $(event.target)
  var url = $target.attr('href')
  $('.container_body').html('')
  $.get(url, function(response){
    response.songs.map(function(obj){
      console.log(obj)
      var newSong = new songObject(obj);
      newSong.show();
    })
  })
}