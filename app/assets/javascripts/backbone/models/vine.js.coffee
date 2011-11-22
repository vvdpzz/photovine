class Photovine.Models.Vine extends Backbone.Model
  paramRoot: 'vine'
  defaults:
    id: null
    name: null
    photos_count: null
    photos: []
  
class Photovine.Collections.VinesCollection extends Backbone.Collection
  model: Photovine.Models.Vine
  url: '/vines'