class Photovine.Views.Photos extends Backbone.View
  template: JST["backbone/templates/vines/photo"]
  
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @collection.bind('add', @addOne)
   
  addAll: () ->
    @collection.each(@addOne)
  
  addOne: (photo) ->
    $(@el).prepend(@template(photo.toJSON()))
       
  render: ->
    @addAll()
    @