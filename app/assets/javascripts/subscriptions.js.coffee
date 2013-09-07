jQuery ->
  # ======== ABONNEMENT ACTUEL =========
  $plusinfo = $('.btn.sub-plusinfo')
  $divplusinfo = $('div.plusinfo')
  $annulation = $('.annulation')
  
  $divplusinfo.hide()
  $('.credit-card-form').hide()
  $annulation.hide()
  
  $plusinfo.click( ->
    $divplusinfo.toggle('400')
    
    if $plusinfo.text() is "Plus"
      $plusinfo.text "Moins"
    else
      $plusinfo.text "Plus"
  )
  
  # Annuler
  $('.btn.sub-annuler').click( ->
    $annulation.show()
  )
  
  $('.annuler-annulation').click (e) ->
    e.preventDefault()
    $annulation.hide()
    
  $('.btn.sub-changer').click ->
    # $('.panel-credit-card .credit-card-info').toggle('slow')
    # $('.credit-card-form').toggle('slow')
    
    $('.credit-card-info').children('.alert').remove()
    $('.credit-card-info').prepend('<div class="alert alert-warning">Pour l\'instant, vous ne pouvez que supprimer une carte de crédit. Pour la changer, contactez-nous.</div>')
    
  $('.btn.sub-detruire').click ->
    $('.credit-card-info').children('.alert').remove()
    $('.credit-card-info').prepend('<div class="alert alert-warning">La suppression de votre carte de crédit entrainera l\'annulation de votre abonnement. Si c\'est ce que vous désirez, <b>annuler l\'abonnement directement</b>.</div>')
    
    
  $('.btn.annuler-change-cc').click ->
    $('.panel-credit-card .credit-card-info').toggle('slow')
    $('.credit-card-form').toggle('slow')
  
  # ======== STRIPE =========
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  
  $("#payment-form input, #payment-form select").attr("disabled", false);
  
  # Set some form features with Payment.jQuery
  $('input.cc-num').payment('formatCardNumber')
  $('input.cc-cvc').payment('formatCardCVC');
  
  # SEND FORM TO STIPE AFTER VALIDATION
  $('#payment-form').submit( (event) ->
    $form = $(this);
    $error = $('.payment-errors')
    
    $error.text ""
    
    # Validate before sending
    if !$.payment.validateCardNumber($('[data-stripe=number]').val())
      $error.text 'Numéro de carte invalide'
      return false
    else if !$.payment.validateCardCVC($('[data-stripe=cvc]').val(), $.payment.cardType($('[data-stripe=number]').val()))
      $error.text 'Code de sécurité invalide'
      return false
    else if !$.payment.validateCardExpiry($('[data-stripe=exp-month]').val(), $('[data-stripe=exp-year]').val())
      $error.text 'Expiration invalide'
      return false
    else
      $form.find('.btn').button('loading')
      $("#payment-form input, #payment-form select").attr("disabled", true);
    
      Stripe.createToken($form, stripeResponseHandler)
    
    return false
  )
  
  stripeResponseHandler = (status, response) ->
    $form = $("#payment-form")
    if response.error
      # Show the errors on the form
      $form.find(".payment-errors").html 'Message du processeur de paiement (anglais): ' + '<em>' + response.error.message + '</em>'
      $form.find('.btn').button('reset')
      $("#payment-form input, #payment-form select").attr("disabled", false);
      
    else
    
      # token contains id, last4, and card type
      token = response.id
    
      # Insert the token into the form so it gets submitted to the server
      $form.append $("<input type=\"hidden\" name=\"stripeToken\" />").val(token)
    
      # and submit
      $form.get(0).submit()