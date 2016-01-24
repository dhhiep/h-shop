window.main_image_zoom = -> 
  $('.img-main-image').elevateZoom()

$ ->
  if $('.img-main-image').length > 0
    window.main_image_zoom()

  if $(".thumbnails").length > 0 
    $('.thumbnail-item').on 'click', ->
      large_image_url = $(@).data('source')
      # $('.main-image .img-main-image').attr('src', large_image_url)
      $('.main-image .expand-image').attr('href', large_image_url).attr('data-zoom-image', large_image_url)
      $('.img-main-image').data('elevateZoom').swaptheimage(large_image_url, large_image_url)