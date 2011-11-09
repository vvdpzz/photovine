Photovine.Views.Vines ||= {}

class Photovine.Views.Vines.NewView extends Backbone.View    
  template: JST["backbone/templates/vines/new"]
  
  events:
    "submit #new-vine": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (vine) =>
        @model = vine
        window.location.hash = "!/#{@model.id}"
        
      error: (vine, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $("li").removeClass("active")
    $("#new-vine-page").addClass("active")
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this