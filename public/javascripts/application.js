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

  $(document).on('submit', '.login_form', function(event){
    event.preventDefault();
    loginValidation('.login_form')
  })

  $(document).on('submit', '.signup_form', function(event){
    event.preventDefault();
    loginValidation('.signup_form')
  })





})