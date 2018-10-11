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

  $('.remove_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
      type:     'DELETE'
      dataType: 'json'
      data:     {}
      success: (data) ->
        M.toast({ html: data.message, displayLength: 2000, classes: 'green' })

        $(location).attr('href','/campaigns')
      error: (jqXHR, data, errorThrown) ->
        M.toast({ html: jqXHR.responseJSON.message, displayLength: 2000, classes: 'red' })
    return false

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
