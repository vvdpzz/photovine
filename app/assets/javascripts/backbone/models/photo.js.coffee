class Photovine.Models.Photo extends Backbone.Model
  paramRoot: 'photo'
  
class Photovine.Collections.PhotosCollection extends Backbone.Collection
  model: Photovine.Models.Photo
  initialize: (models, options) ->
    @url = "/vines/#{options.id}/photos"