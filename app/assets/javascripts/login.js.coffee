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
      self = document.Login
      $.post '/login', password: self.password().val(), (success) ->
        if success
          self.master().fadeOut()
        else
          self.failure().slideDown()
      self.password().val ''

