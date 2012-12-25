$(document).ready ->
  $('form .answer').click ->
    $.fn.log 'click'
    value = $(this).closest('.answer').find('input[type=checkbox]').attr 'checked'
    $(this).closest('.answer').find('input[type=checkbox]').attr 'checked', !value
    $(this).closest('.answer').toggleClass('checked')
