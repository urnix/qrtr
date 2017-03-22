{FlowRouter} = require 'meteor/kadira:flow-router'
{BlazeLayout} = require 'meteor/kadira:blaze-layout'

# Import needed templates
require '../../ui/layouts/body/body.coffee'
require '../../ui/pages/home/home.coffee'
require '../../ui/pages/object/object.coffee'
require '../../ui/pages/not-found/not-found.coffee'

# Set up all routes in the app
FlowRouter.route '/',
  name: 'App.home'
  action: ->
    BlazeLayout.render('App_body', main: 'App_home')
#    FlowRouter.go('/home')

FlowRouter.route '/:objectId',
  name: 'object'
  action: ->
    BlazeLayout.render('App_body', main: 'App_object')

FlowRouter.notFound =
  action: ->
    BlazeLayout.render('App_body', main: 'App_notFound')
