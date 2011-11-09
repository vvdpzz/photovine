class Photovine.Models.Vine extends Backbone.Model
  paramRoot: 'vine'
  defaults:
    name: null
  
class Photovine.Collections.VinesCollection extends Backbone.Collection
  model: Photovine.Models.Vine
  url: '/vines'