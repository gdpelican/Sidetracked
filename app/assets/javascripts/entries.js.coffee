$ ->
  @Entries =
    initialize: ->
      @master().on 'click', '.show-hidden-entries', ->
        $(@).slideUp ->
          $(@).siblings('.hidden').slideDown -> $(@).css('display', 'inline-block')
    master: ->
      $('body')
