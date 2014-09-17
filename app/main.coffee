# # Require Dependencies
$ = require '../bower_components/jquery/dist/jquery.js'
_ = require 'underscore'
window.Backbone = require 'backbone'
Backbone.$ = $

# # Plug Ganalytics to Backbone

# Override the navigate method to plug Ganalytics to it
originalLoadUrl = Backbone.History.prototype.loadUrl;
# This cleans up fragment the same way that loadUrl
Backbone.History.prototype.loadUrl = (fragmentOverride) ->
  fragment = this.fragment = this.getFragment(fragmentOverride)
  if window.ga != undefined
    window.ga('send', 'pageview', {'page': '/' + fragment})
  return originalLoadUrl.call(this, fragmentOverride)

originalNavigate = Backbone.History.prototype.navigate
# This doesn't clean up fragment before sending to GA, so there may be normalization issues
Backbone.History.prototype.navigate = (fragment, triggerRoute) ->
  if !triggerRoute && window.ga != undefined
    window.ga('send', 'pageview', {'page': '/' + fragment})
  return originalNavigate.call(this, fragment, triggerRoute)


# # App Initialization

Router = require './routes/Router.coffee'
Controller = require './views/Controller.coffee'

class App
  constructor: (config) ->
    $.ajaxPrefilter ( options, originalOptions, jqXHR ) ->
      options.url = "http://"+config.domain_api+options.url;
      options.crossDomain = true

    @dispatcher = _.clone(Backbone.Events)
    Backbone.Router.prototype.dispatcher =
    Backbone.View.prototype.dispatcher = @dispatcher


    # Initialize the application
    router = new Router()
    controller = new Controller()

    Backbone.history.start(pushState: false)
    return @


$(document).on 'ready', ->
  app = new App
    domain_api: "localhost"