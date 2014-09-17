module.exports = class Router extends Backbone.Router
  routes:
    '': 'index'
    '*404': '404'

  # ## index()
  # launch the whole app
  index: () ->
    return

  404: () ->
    @navigate '', trigger: true
    return


