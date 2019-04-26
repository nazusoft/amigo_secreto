window.removeCampaignConfirmed = (campaign_id) ->
  $.ajax '/campaigns/'+campaign_id,
    type:     'DELETE'
    dataType: 'json'
    data:     {}
    success: (data) ->
      M.toast({ html: data.message, displayLength: 2000, classes: 'green' })

      $(location).attr('href','/campaigns')
    error: (jqXHR, data, errorThrown) ->
      M.toast({ html: jqXHR.responseJSON.message, displayLength: 2000, classes: 'red' })
  return false

$(document).on 'turbolinks:load', ->
  $('.update_campaign input').bind 'blur', ->
    $('.update_campaign').submit()

  $('.update_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
      type:     'PUT'
      dataType: 'json'
      data:     $(".update_campaign").serialize()
      success: (data) ->
        M.toast({ html: data.message, displayLength: 2000, classes: 'green' })
      error: (jqXHR, data, errorThrown) ->
        M.toast({ html: jqXHR.responseJSON.message, displayLength: 2000, classes: 'red' })
    return false

  $('body').on 'click', 'a.remove_campaign', (e) ->
    header  = "<h4>Remover Campanha</h4>"
    body    = "<p>Deseja realmente remover essa campanha?</p>"
    footer  = "<a href='#' class='modal-close waves-effect waves-green btn-flat' onclick='removeCampaignConfirmed("+e.currentTarget.id+")'>SIM</a>"
    footer += "<a href='#' class='modal-close waves-effect waves-green btn-flat'>NÃO</a>"

    abrirModal(header,body,footer)

  $('.raffle_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
      type:     'POST'
      dataType: 'json'
      data:     {}
      success: (data) ->
        M.toast({ html: data.message, displayLength: 2000, classes: 'green' })
      error: (jqXHR, data, errorThrown) ->
        M.toast({ html: jqXHR.responseJSON.message, displayLength: 2000, classes: 'red' })
    return false
