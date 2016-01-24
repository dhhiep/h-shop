$ ->
  main_slider = do ->
    $navArrows = $('#nav-arrows')
    $nav = $('#nav-dots > span')
    slitslider = $('#slider').slitslider(
      autoplay: true,
      onBeforeChange: (slide, pos) ->
        $nav.removeClass 'nav-dot-current'
        $nav.eq(pos).addClass 'nav-dot-current'
        return
    )

    init = ->
      initEvents()
      return

    initEvents = ->
      # add navigation events
      $navArrows.children(':last').on 'click', ->
        slitslider.next()
        false
      $navArrows.children(':first').on 'click', ->
        slitslider.previous()
        false
      $nav.each (i) ->
        $(this).on 'click', (event) ->
          $dot = $(this)
          if !slitslider.isActive()
            $nav.removeClass 'nav-dot-current'
            $dot.addClass 'nav-dot-current'
          slitslider.jump i + 1
          false
        return
      return

    { init: init }
  main_slider.init()

  $('#slider #nav-arrows').fadeOut()
  $('#slider').mouseenter(->
    $('#slider #nav-arrows').fadeIn(0)
    return
  ).mouseleave ->
    $('#slider #nav-arrows').fadeOut(0)
    return
  ###*
  # Notes: 
  # 
  # example how to add items:
  ###

  ###

  var $items  = $('<div class="sl-slide sl-slide-color-2" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1"><div class="sl-slide-inner bg-1"><div class="sl-deco" data-icon="t"></div><h2>some text</h2><blockquote><p>bla bla</p><cite>Margi Clarke</cite></blockquote></div></div>');

  // call the plugin's add method
  ss.add($items);
  ###

  return

# ---
# generated by js2coffee 2.1.0