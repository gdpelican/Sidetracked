$ ->
  unless $('body').hasClass('admin') 
    @Main.initialize()
    @Acts.initialize()
    @Calendar.initialize()
    @Entries.initialize() 
    @Home.initialize()
