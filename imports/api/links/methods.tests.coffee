# Tests for links methods
#
# https://guide.meteor.com/testing.html

{Meteor} = require 'meteor/meteor'
{assert} = require 'meteor/practicalmeteor:chai'
{Links} = require './links.coffee'
require './methods.coffee'

if Meteor.isServer
  describe 'links methods', ->
    beforeEach ->
      Links.remove {}
      return
    it 'can add a new link', ->
      addLink = Meteor.server.method_handlers['links.insert']
      addLink.apply {}, [
        'meteor.com'
        'https://www.meteor.com'
      ]
      assert.equal Links.find().count(), 1
      return
    return
