var createLyrics = function(formName, editableContent, hiddenInput, type){
  var value = $(editableContent).text().replace(/\n/g,"<br />");
  console.log(value)
  $(hiddenInput).attr('value', value);
  console.log($(hiddenInput))
  var data = $(formName).serialize();
  var url = $(formName).attr('action');
  $.ajax({
    url: url,
    type: type,
    data: data,
    success: function(response){
      window.location.replace(response.location)
    }
  })

}