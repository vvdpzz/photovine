Photovine.Views.Vines ||= {}

class Photovine.Views.Vines.VineView extends Backbone.View
  template: JST["backbone/templates/vines/vine"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "div"
  className: "vine clearfix"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this