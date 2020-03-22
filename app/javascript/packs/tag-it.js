require('tag-it/js/tag-it.min')

require('jquery-ui-dist/jquery-ui.min')

$(document).on('turbolinks:load' ,function() {
  $("#tag-input").tagit({
    fieldName: 'tags',
    singleField: true,
    allowSpaces: true
  });
  const tag_string = $('#hidden_tag').val();
  try {
    tag_list = tag_string.split(',');
    for (const tag of tag_list) {
      $('#tag-input').tagit('createTag', tag);
      console.log(tag)
    }
    
  } catch (error) {
    
  }
});