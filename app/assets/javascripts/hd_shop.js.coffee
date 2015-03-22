window.onload = ->
  $('#page_loading').addClass('animated fadeOutUp')
$(document).ready ->
  Messenger.options =
    extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right'
    theme: 'flat'

  $('#menu-button').click ->
    $('#top-nav-bar').slideToggle 1000, ->

  $(".bxslider").bxSlider
    pager: false
    auto: true
    autoHover: true

  $(".owl-carousel").owlCarousel
    items: 4
    pagination: false
    autoPlay: true
    navigation: true
    navigationText: [ "<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>" ]
    rewindNav: true
    scrollPerPage: true
    slideSpeed: 800
    stopOnHover: true


  $("#scroll_to_top").click ->
    $("#header").ScrollTo
      duration: 1500
      easing: 'easeInOutCirc'

  $(window).scroll ->
    if $(this).scrollTop()
      $('#scroll_to_top').fadeIn()
    else
      $('#scroll_to_top').fadeOut()

  wow = new WOW(
    boxClass: "wow" # animated element css class (default is wow)
    animateClass: "animated" # animation css class (default is animated)
    offset: 0 # distance to the element when triggering the animation (default is 0)
    mobile: true # trigger animations on mobile devices (default is true)
    live: true # act on asynchronously loaded content (default is true)
  )
  wow.init()