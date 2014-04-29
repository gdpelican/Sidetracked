$ ->
  @Calendar =
    master: -> $('article.calendar')
    gigId: -> @master().data('gig-id')
    gigCalendar: null
    
    initialize: () ->
      @fetchCalendar()

      @master().on 'click', '.next-month, .previous-month', (e) =>
        e.preventDefault()
        url = $(e.target).attr('href')
        url = @appendGigId url
        $.post url, @placeCalendar
      
      if @gigId() >= 0
        @master().on 'click', '.day:not(.not-current-month)', (e) =>
          $(e.currentTarget).toggleClass('events no-events')
          @syncDate($(e.currentTarget).data('date-iso'))
      else
        @master().on 'click', '.events:not(.selected)', (e) =>
          e.preventDefault()
          $(e.currentTarget).closest('tbody').find('.selected') \
             .add($(e.currentTarget)) \
             .toggleClass('selected') \
             .find('.entry').fadeToggle()
              
        @master().on 'click', '.events.selected', (e) ->
          $(@).removeClass('selected').find('.entry').fadeToggle()
    
    appendGigId: (url) ->
      url += "?gig_id=#{@gigId()}" if @gigId() >= 0
      url
    
    syncDate: (date) ->
      if date in @gigCalendar.dates()
        @gigCalendar.dates.remove(date)
      else
        @gigCalendar.dates.push(date)
             
    fetchCalendar: (master, month, year) ->
      url = if (month? && year?) then "/calendar/#{year}/#{month}" else "/calendar/"
      url = @appendGigId url
      $.post url, @placeCalendar
      
    placeCalendar: (data) ->
      document.Calendar.master().html(data.calendar).find('.events').each (index, el) => 
        element = $(el)
        if element.offset().left + \
           element.width() + \
           element.find('.entry').width() > \
           window.screen.width then \
           element.find('.entry').addClass('flip')

  @Knockout =
    initialize: ->
      document.Calendar.gigCalendar = new GigCalendar($('#dates').val().split('|'))
      ko.applyBindings(document.Calendar.gigCalendar)

class @GigCalendar
  constructor: (dates = []) ->
    @monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", \
                   "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @dates = ko.observableArray(dates)
    @stringDates = ko.computed => @dates().sort().join '|'
    @formattedDates = ko.computed =>
      @dates().sort().map (date) => 
        d = new Date(date)
        d.setDate(d.getDate() + 1)
        "#{@monthNames[d.getMonth()]} #{d.getDate()}, #{d.getFullYear()}"
