Photovine.Views.Vines ||= {}

class Photovine.Views.Vines.ShowView extends Backbone.View
  template: JST["backbone/templates/vines/show"]
  
  initialize: ->
    _.bindAll(this, 'render', 'loadPhotos')
    @photos = new Photovine.Collections.PhotosCollection([], {id: @model.id})
    @photosView = new Photovine.Views.Photos({collection: @photos})
  
  loadPhotos: ->
    that = this
    @photos.fetch
      success: =>
        that.$("#photos").html(@photosView.render().el)
   
  render: ->
    $("li").removeClass("active")
    $("#vines-page").addClass("active")
    $(this.el).html(@template(@model.toJSON() ))
    @loadPhotos()
    return this
  
  initUploadify:(id, vine) ->
    that = this
    uploadify_script_data["vine_id"] = id
    @$("#uploadify").uploadify
      uploader: "/assets/uploadify.swf"
      script: "/photos"
      cancelImg: "/assets/cancel.png"
      auto: true
      multi: true
      removeCompleted: true
      fileExt: "*.jpg;*.jpeg;*.gif;*.png"
      fileDesc: "Image Files (.JPG, .JPEG, .GIF, .PNG)"
      scriptData: uploadify_script_data
      wmode: "transparent"
      hideButton: true
      height: 21
      width: 94
      queueID: "photoUploadQueue"
      onComplete: (event, ID, fileObj, response, data) ->
        response = eval("(" + response + ")")
        photo = new Photovine.Models.Photo(response)
        that.photos.add(photo)
        vine.set({cover: response.thumb})