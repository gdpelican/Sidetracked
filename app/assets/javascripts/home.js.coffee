$ ->
  @Home =
    initialize: ->
      @video().volume = 0 
      @master().on 'click', '.listen', @toggleVolume
    master: ->
      $('#home')
    video: ->
      document.getElementById('video')
    toggleVolume: =>
      listen = @Home.master().find('.listen')
      listen.find('.fa').toggleClass('fa-volume-up fa-volume-off') 
      listen.find('span:visible').slideUp ->
        $(@).siblings('span').slideDown()
      @Home.video().volume = !@Home.video().volume
      
  @Home.initialize()