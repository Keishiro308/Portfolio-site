require('summernote/dist/summernote-bs4')
require('summernote/dist/lang/summernote-ja-JP')
require('summernote/dist/font')

$('document').on('ready turbolinks:load', function(){
  $('#summernote').summernote();
});