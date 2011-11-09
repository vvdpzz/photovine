Photovine.Views.Vines ||= {}

class Photovine.Views.Vines.IndexView extends Backbone.View
  template: JST["backbone/templates/vines/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.vines.bind('reset', @addAll)
   
  addAll: () ->
    @options.vines.each(@addOne)
  
  addOne: (vine) ->
    view = new Photovine.Views.Vines.VineView({model : vine})
    @$(@el).append(view.render().el)
       
  render: ->
    $("li").removeClass("active")
    $("#vines-page").addClass("active")
    $(@el).html(@template(vines: @options.vines.toJSON() ))
    @addAll()
    
    return this