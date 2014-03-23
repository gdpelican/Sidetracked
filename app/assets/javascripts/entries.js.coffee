$ ->
  @Entries =
    initialize: ->
      @master().on 'click', '.show-hidden-entries', ->
        $(@).slideUp ->
          $(@).siblings('.hidden-entry-container').slideDown()
    master: ->
      $('body')
      
  @Entries.initialize()