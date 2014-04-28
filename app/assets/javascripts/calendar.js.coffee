$ ->
  @Calendar =
    initialize: ->
      @fetch()
      master = $('article.calendar')
      master.on 'click', '.next-month, .previous-month', (e) =>
        e.preventDefault()
        $.post $(e.target).attr('href'), @placeCalendar
      master.on 'click', '.events:not(.selected)', (e) ->
        e.preventDefault()
        $(@).closest('tbody').find('.selected').add($(@)) \
            .toggleClass('selected')
            .find('.entry').fadeToggle()
      master.on 'click', '.events.selected', (e) ->
        $(@).removeClass('selected').find('.entry').fadeToggle()
            
    fetch: (month, year) ->
      url = if (month? && year?) then "/calendar/#{year}/#{month}" else "/calendar/"
      $.post url, @placeCalendar
    placeCalendar: (data) ->
      $('article.calendar').html(data).find('.events').each (index, el) => 
        element = $(el)
        if element.offset().left + \
           element.width() + \
           element.find('.entry').width() > \
           window.screen.width then \
           element.find('.entry').addClass('flip')
