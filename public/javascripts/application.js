// Javascript Goes Here~
//
$(document).ready(function(){
  $(document).on('click', '.login', function(event){
    event.preventDefault();
    renderPartial('.login');
  })

  $(document).on('click', '.signup', function(event){
    event.preventDefault();
    renderPartial('.signup');
  })




})