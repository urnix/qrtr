# Methods related to links

{Meteor} = require 'meteor/meteor'
{check} = require 'meteor/check'
{Links} = require './links.coffee'
{Email} = require 'meteor/email'

Meteor.methods
  'send_email': (objectId, message) ->
    check objectId, String
    check message, String
    @unblock()
    try
      recipientEmails = Meteor.settings.recipientEmails
      i = 0
      while i < recipientEmails.length
        Email.send
          to: recipientEmails[i]
          from: 'Qrtr.ru <alert@qrtr.ru>'
          subject: 'Сообщение от гражданина через Qrtr.ru'
          text: 'Идентификатор объекта: ' + objectId + '\nСообщение пользователя: ' + message
        i++
    catch error
      console.error error
      throw error
    true
  'links.insert': (title, url) ->
    check url, String
    check title, String
    Links.insert
      url: url
      title: title
      createdAt: new Date
