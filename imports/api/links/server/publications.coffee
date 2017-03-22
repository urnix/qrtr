# All links-related publications

{Meteor} = require 'meteor/meteor'
{Links} = require '../links.coffee'

Meteor.publish 'links.all', ->
  return Links.find()
