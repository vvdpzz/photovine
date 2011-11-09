Photovine.Views.Vines ||= {}

class Photovine.Views.Vines.EditView extends Backbone.View
  template : JST["backbone/templates/vines/edit"]
  
  events :
    "submit #edit-vine" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (vine) =>
        @model = vine
        window.location.hash = "!/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this