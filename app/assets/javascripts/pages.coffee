window.abrirModal = (header,body,footer) ->
  $('#modal_header').html(header)
  $('#modal_body')  .html(body)
  $('#modal_footer').html(footer)

  $('.modal').modal().modal('open',{
    dismissible: false
  })
  return false

$(document).ready ->
  M.updateTextFields()

  $('.alert-close').click ->
    $('.alert').remove()
