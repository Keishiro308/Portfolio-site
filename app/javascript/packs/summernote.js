require('summernote/dist/summernote-bs4')
require('summernote/dist/summernote-bs4.css')
require('summernote/dist/lang/summernote-ja-JP')

$(document).on('ready turbolinks:load', function(){
  $('#summernote').summernote();
});
