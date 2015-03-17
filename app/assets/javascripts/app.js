$(document).ready(function(){
  // auth
  $(document).on('click', '.login', function(event){
    event.preventDefault();
    renderPartial('.login', 'href');
  })

  $(document).on('click', '.signup', function(event){
    event.preventDefault();
    renderPartial('.signup', 'href');
  })

  $(document).on('click', '.about', function(event){
    event.preventDefault();
    renderPartial('.about', 'href');
  })

  $(document).on('submit', '.new_session', function(event){
    event.preventDefault();
    loginValidation('.new_session')
  })

  $(document).on('submit', '.new_user', function(event){
    event.preventDefault();
    loginValidation('.new_user')
  })

  $(document).on('click', '.logout', function(event){
    event.preventDefault();
    $('.button_to').submit();
  })

  $(document).on('click', 'a.bestof_anchor', function(event){
    event.preventDefault();
    renderJSON(event);
  })

  $(document).on('click', 'a.songs_anchor', function(event){
    event.preventDefault();
    renderJSON(event);
  })

  // // all songs page
  // $(document).on('click','.lyric', function(event){
  //   $('.lyric').css('height', 'auto');
  // } )


  $(document).on('submit', '.new_lyric', function(event){
    createLyrics('.new_lyric', '.lyric', '#lyric_text','post' )
  })
  $(document).on('submit','.edit_lyric', function(event){
    createLyrics('.edit_lyric', '.lyric_display','.edit_text', 'put')

  })

  // $(document).on('click', '.upvote', function(event){
  //   event.preventDefault();
  //   var $target = $(event.target);
  //   var url = $target.attr('href');
  //   upVote(url);
  // })



})