$ ->
  @Home =
    initialize: ->
      @video().volume = 0 
      @master().on 'click', '.listen', @toggleVolume
      @about().on 'click', '.act', => @toggleVolume() if @video().volume > 0
    master: ->
      $('#home')
    about: ->
      $('#about')
    video: ->
      document.getElementById('video')
    toggleVolume: =>
      listen = @Home.master().find('.listen')
      listen.find('.fa').toggleClass('fa-volume-up fa-volume-off') 
      listen.find('span:visible').slideUp ->
        $(@).siblings('span').slideDown()
      @Home.video().volume = !@Home.video().volume
      
  @Home.initialize()