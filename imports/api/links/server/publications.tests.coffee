# Tests for the links publications
#
# https://guide.meteor.com/testing.html

{assert} = require 'meteor/practicalmeteor:chai'
{Links} = require '../links.coffee'
{PublicationCollector} = require 'meteor/johanbrook:publication-collector'
require './publications.coffee'

describe 'links publications', ->
  beforeEach ->
    Links.remove {}
    Links.insert
      title: 'meteor homepage'
      url: 'https://www.meteor.com'
    return
  describe 'links.all', ->
    it 'sends all links', (done) ->
      collector = new PublicationCollector
      collector.collect 'links.all', (collections) ->
        assert.equal collections.links.length, 1
        done()
        return
      return
    return
  return
