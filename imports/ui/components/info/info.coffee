{Links} = require '/imports/api/links/links.coffee'
{Meteor} = require 'meteor/meteor'
require './info.jade'

Template.info.onCreated ->
  Meteor.subscribe 'links.all'
  return

Template.info.helpers links: ->
  Links.find {}

Template.info.events 'submit .info-link-add': (event) ->
  event.preventDefault()
  target = event.target
  title = target.title
  url = target.url
  Meteor.call 'links.insert', title.value, url.value, (error) ->
    if error
      alert error.error
    else
      title.value = ''
      url.value = ''
    return
  return
