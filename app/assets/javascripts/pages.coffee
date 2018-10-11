$(document).ready ->
  M.updateTextFields();

  $('.alert-close').click ->
    $('.alert').remove()

  $('.btn').click ->
    $('#'+this.id).attr('disabled',true)
    $('#preloading').removeClass('hide')
