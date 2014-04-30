start = ->
  hasCalendar = $('article.calendar').length
  isAdmin = $('body').hasClass('admin')
  
  unless $('body').hasClass('admin') 
    @Main.initialize()
    @Acts.initialize()
    @Entries.initialize() 
    @Home.initialize()
  @Calendar.initialize(isAdmin) if hasCalendar
  @Login.initialize()           if isAdmin
  @Knockout.initialize()        if hasCalendar && isAdmin

$(document).ready start
$(document).on 'page:load', start