# Fill the DB with example data on startup

{Meteor} = require 'meteor/meteor';
{Links} = require '../../api/links/links.coffee';

Meteor.startup ->
  # if the Links collection is empty
  if Links.find().count() == 0
    data = [
      {
        title: 'Do the Tutorial'
        url: 'https://www.meteor.com/try'
        createdAt: new Date
      }
      {
        title: 'Follow the Guide'
        url: 'http://guide.meteor.com'
        createdAt: new Date
      }
      {
        title: 'Read the Docs'
        url: 'https://docs.meteor.com'
        createdAt: new Date
      }
      {
        title: 'Discussions'
        url: 'https://forums.meteor.com'
        createdAt: new Date
      }
    ]
    data.forEach (link) ->
      Links.insert link
  return
