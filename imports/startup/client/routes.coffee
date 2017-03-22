{FlowRouter} = require 'meteor/kadira:flow-router'
{BlazeLayout} = require 'meteor/kadira:blaze-layout'

# Import needed templates
require '../../ui/layouts/body/body.coffee'
require '../../ui/pages/home/home.coffee'
require '../../ui/pages/not-found/not-found.coffee'

# Set up all routes in the app
# FlowRouter.route('/', {
#   name: 'App.home',
#   action() {
#     FlowRouter.go('/go/')
#   },
# })
FlowRouter.route '/go/:objectId?/:message?',
  name: 'App.home'
  action: ->
    BlazeLayout.render 'App_body', main: 'App_home'
    return
FlowRouter.notFound = action: ->
  FlowRouter.go '/go/'
  # BlazeLayout.render('App_body', {main: 'App_notFound'})
  return
