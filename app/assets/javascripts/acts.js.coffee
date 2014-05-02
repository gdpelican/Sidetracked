$ ->
  @Acts =
    initialize: ->
      @master().on 'click', '.act', (event) =>
        event.preventDefault()
        act = event.currentTarget
        @playing.pause() unless @playing == null
        
        if !$(act).hasClass 'playing'
          @master().find('.playing').removeClass('playing')
          @playing = new Audio($(act).data('link'))
          @playing.play()
          
        $(act).toggleClass('playing')
        
    master: ->
      $('body').find('.acts-container')
    playing: null