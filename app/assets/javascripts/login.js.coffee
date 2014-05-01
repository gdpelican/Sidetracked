$ ->
  @Login =
    master: -> $('body').find('.login-form')
    password: -> @master().find('input[type=password]')
    failure: -> @master().find('.failure-message')
    initialize: ->
      @master().on 'click', 'input[type=submit]', @login
      @master().on 'keypress', 'input[type=password]', (e) =>
        @failure().slideUp()
        @login() if e.keyCode == 13
    login: -> 
      $.post '/login', password: @password().val(), (success) ->
        if success
          document.Login.master().fadeOut()
        else
          document.Login.failure().slideDown()
      @password().val ''

