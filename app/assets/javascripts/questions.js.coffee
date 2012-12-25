
hotKey = false

$(document).ready ->
  $.fn.setTrue()
  $('textarea').autosize()
  $('form').live 'nested:fieldAdded', (event) ->
    $last = $('.fields:visible textarea').last()
    $last.select()
    $last.removeAttr('style').autosize()
    $.fn.setTrue()

  $(window).keydown (evt) ->
    if evt.which == 18 # altKey keydown
      hotKey = true
    if hotKey
      if evt.which == 74 # i key pressed
        $('.add_nested_fields').trigger 'click'
      if evt.which == 75
        $(evt.target).closest('.option').find('input[type=checkbox]').trigger('click')
        $(evt.target).closest('.option').toggleClass('true')
      else
        $.fn.log evt.which

  $(window).keyup (evt) ->
    if evt.which == 18
      hotKey = false

$.fn.setTrue = ->
  $.fn.log 'setTrue'
  $('input[type=checkbox]').click (evt) ->
    $.fn.log $(this).attr('checked')
    # $(this).closest('.option').toggleClass('true')
    $target = evt.target
    if $($target).attr('checked') == 'checked'
      $($target).closest('.option').addClass('true')
    else
      $($target).closest('.option').removeClass('true')
    # evt.stopPropagation()

#  $("textarea").autoResize
#    # onResize: ->
#    #   $(this).css opacity: 0.8
#    # animateCallback: ->
#    #   $(this).css opacity: 1
#    animateDuration: 300
#    extraSpace: 40
