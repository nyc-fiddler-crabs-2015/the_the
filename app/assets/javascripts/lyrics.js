var createLyrics = function(formName, editableContent, hiddenInput, type){
  console.log('yoo')
  var value = $(editableContent).text().replace(/\n/g,"<br />");
  console.log(value)
  $(hiddenInput).attr('value', value);
}