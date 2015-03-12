// Javascript Goes Here~
//
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

  $(document).on('submit', '.login_form', function(event){
    event.preventDefault();
    loginValidation('.login_form')
  })

  $(document).on('submit', '.signup_form', function(event){
    event.preventDefault();
    loginValidation('.signup_form')
  })

  // all songs page
  $(document).on('click','.lyric', function(event){
    $('.lyric').css('height', 'auto');
  } )


  $(document).on('submit', '.new_lyrics', function(event){
    event.preventDefault();
    createLyrics('.new_lyrics', '.lyric', '.create_text','post' )
  })
  $(document).on('submit','.edit_lyrics', function(event){
    event.preventDefault();
    createLyrics('.edit_lyrics', '.lyric_display','.edit_text', 'put')

  })

  $(document).on('click', '.upvote', function(event){
    event.preventDefault();
    var $target = $(event.target);
    var url = $target.attr('href');
    upVote(url);
  })



})