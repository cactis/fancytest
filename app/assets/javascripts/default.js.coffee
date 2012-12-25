(($) ->
  $.fn.developmentMode = ->
    true if window.location.hostname.match('local')

  $.fn.log = (msg, hr) ->
    if $.fn.developmentMode()
      console.log hr if hr && hr.length > 0
      console.log msg

  # 取得 dom_id 的 id 值
  $.fn.id = ->
    $(this).attr('id').split('_').pop() if $(this).attr('id')

  $.fn.auto_external_link = ->
    $("a.external").each ->
      $(this).attr "target", "_blank"
    $("a[href^='http']").each ->
      $(this).attr "target", "_blank"#  if @href.indexOf(location.hostname) == -1

  #  $.fn.autogrow = (options) ->
  #    @filter("textarea").each ->
  #      $this = $(this)
  #      minHeight = $this.height()
  #      lineHeight = $this.css("lineHeight")
  #      shadow = $("<div></div>").css(
  #        position: "absolute"
  #        top: -10000
  #        left: -10000
  #        width: $(this).width()
  #        fontSize: $this.css("fontSize")
  #        fontFamily: $this.css("fontFamily")
  #        lineHeight: $this.css("lineHeight")
  #        resize: "none"
  #      ).appendTo(document.body)
  #      update = ->
  #        val = @value.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/&/g, "&amp;").replace(/\n/g, "<br/>")
  #        shadow.html val
  #        $(this).css "height", Math.max(shadow.height() + 20, minHeight)

  #      $(this).change(update).keyup(update).keydown update
  #      update.apply this
  #    this
  $.fn.clearSelection = ->
    sel = undefined
    if document.selection and document.selection.empty
      document.selection.empty()
    else if window.getSelection
      sel = window.getSelection()
      sel.removeAllRanges()  if sel and sel.removeAllRanges
) jQuery
