$ ->
  @Login =
    master: -> $('body').find('.login-form')
    password: -> @master().find('input[type=password]').val()
    initialize: ->
      @master().on 'click', 'input[type=submit]', @login
      @master().on 'keypress', 'input[type=password]', (e) =>
        @login() if e.keyCode == 13
    login: -> $.post '/login', password: @password(), (success) ->
      document.Login.master().fadeOut() if success
