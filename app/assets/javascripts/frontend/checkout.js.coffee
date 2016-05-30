window.check_same_shipping_address = ->
  if $('#same_shipping').is(':checked')
    $('#billing_address_area').slideUp()
    compare_and_copy_shipping_billing_address_fields()
  else
    $('#billing_address_area').slideDown()

window.compare_and_copy_shipping_billing_address_fields = ->
  return unless $('#same_shipping').is(':checked')
  
  if $('#order_ship_address_attributes_country').val() != $('#order_bill_address_attributes_country').val()
    $('#order_bill_address_attributes_country').val($('#order_ship_address_attributes_country').val())
    $('#order_bill_address_attributes_country').trigger('change')
  
  $('#shipping_address_area input').each (i, e) ->
    element_field_name = $(e).data('field')
    $("#billing_address_area").find('[data-field=' + element_field_name + ']').val($(e).val())

  window.setTimeout((->
    shiping_state = $('[name="order[ship_address_attributes][state]"]').val()
    $('[name="order[bill_address_attributes][state]"]').val(shiping_state)
    $('[name="order[bill_address_attributes][state]"]').trigger('change')
  ), 2000)

$(document).ready ->
  window.setTimeout((->
    $($('input[name="order[payment_methods]"]').get(0)).trigger('change')
  ), 2000)
  
  check_same_shipping_address()

  $('input[name="order[login_method]"]').on 'ifChanged', (event) ->
    if event.target.value == 'guest'
      $('.login_method_guest_area input').prop('disabled', false)
      $('.login_method_account_area input').prop('disabled', true)
    else
      $('.login_method_account_area input').prop('disabled', false)
      $('.login_method_guest_area input').prop('disabled', true)

  $('input[name="order[payment_methods]"]').on 'change', ->
    $('#payment_method_area .payment_method_block').removeClass('active')
    $(@).parents('.payment_method_block').addClass('active')
    $('#payment_method_area .contents > div').fadeOut()
    $('.' + $(@).parents('label').data('content')).fadeIn()

  $('#same_shipping').on 'ifChanged', (event) ->
    check_same_shipping_address()

  # Copy shiping address to billing address
  $('#shipping_address_area input').keyup ->
    window.compare_and_copy_shipping_billing_address_fields()

  # Copy shiping address to billing address
  $('#shipping_address_area select').change ->
    window.compare_and_copy_shipping_billing_address_fields()