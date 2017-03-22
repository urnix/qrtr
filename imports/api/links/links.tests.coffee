# Tests for the behavior of the links collection
#
# https://guide.meteor.com/testing.html

{Meteor} = require 'meteor/meteor'
{assert} = require 'meteor/practicalmeteor:chai'
{Links} = require './links.coffee'

if Meteor.isServer
  describe 'links collection', ->
    it 'insert correctly', ->
      linkId = Links.insert(
        title: 'meteor homepage'
        url: 'https://www.meteor.com')
      added = Links.find(_id: linkId)
      collectionName = added._getCollectionName()
      count = added.count()
      assert.equal collectionName, 'links'
      assert.equal count, 1
      return
    return
