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
    navigationText: [ "<i class='fa fa-chevron-circle-left'></i>", "<i class='fa fa-chevron-circle-right'></i>" ]
    rewindNav: true
    scrollPerPage: true
    slideSpeed: 800
    stopOnHover: true
