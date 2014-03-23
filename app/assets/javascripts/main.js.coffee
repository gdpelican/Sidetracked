$ ->
  @Main =
    initialize: ->
      body = $('body')
      body.find('section').css('min-height', $(window).height())
      
      body.on 'click', '.slide-to[data-target=contact]', (event) ->
        event.preventDefault()
        $('#contact').toggleClass('visible')
      
      body.on 'click', '.reveal', (event) ->
        event.preventDefault()
        target = body.find('#' + $(@).data('target'))
        target.slideDown()
      
      body.on 'click', '.slide-to', (event) ->
        event.preventDefault()
        target = body.find('#' + $(@).data('target'))
        body.animate({ scrollTop: target.offset().top + 1 })
 
      @makeScrollEvent($('#home'), (visible) ->
        $('nav').addClass('light', visible).toggleClass('dark', !visible))
      @makeScrollEvent($('#home'), (visible) ->
        $('#cdLink').toggleClass('visible', !visible))

    isVisible: (element) =>
      window = $(@)
      viewport = { top: window.scrollTop(), bottom: window.scrollTop() + window.height() }
      bounds = { top: element.offset().top, bottom: element.offset().top + element.outerHeight() }
      return !(viewport.bottom < bounds.top || viewport.top > bounds.bottom);

    makeScrollEvent: (element, action) =>
      $(window).on 'scroll', =>
        action @Main.isVisible(element)
    
  @Main.initialize()