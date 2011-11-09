class Photovine.Routers.router extends Backbone.Router
  initialize: (options) ->
    @vines = new Photovine.Collections.VinesCollection()
    @vines.reset options.vines

  routes:
    "!/new"      : "newVine"
    "!/index"    : "index"
    "!/:id/edit" : "edit"
    "!/:id"      : "show"
    ".*"        : "index"

  newVine: ->
    @view = new Photovine.Views.Vines.NewView(collection: @vines)
    $("#vines").html(@view.render().el)

  index: ->
    document.title = "Photovine"
    @view = new Photovine.Views.Vines.IndexView(vines: @vines)
    $("#vines").html(@view.render().el)

  show: (id) ->
    vine = @vines.get(id)
    document.title = "Photovine :: #{vine.get('name')}"
    @view = new Photovine.Views.Vines.ShowView(model: vine)
    $("#vines").html(@view.render().el)
    @view.initUploadify(id, vine)
    
  edit: (id) ->
    vine = @vines.get(id)

    @view = new Photovine.Views.Vines.EditView(model: vine)
    $("#vines").html(@view.render().el)
  