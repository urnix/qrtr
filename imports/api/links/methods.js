// Methods related to links

import {Meteor} from 'meteor/meteor';
import {check} from 'meteor/check';
import {Links} from './links.js';
import {Email} from 'meteor/email'

Meteor.methods({
  'send_email'(objectId, message){
    check(objectId, String);
    check(message, String);
    this.unblock();
    try {
      let recipientEmails = Meteor.settings.recipientEmails;
      for (let i = 0 ; i < recipientEmails.length; i++) {
        Email.send({
          to: recipientEmails[i],
          from: 'alert@qrtr.ru',
          subject: 'Сообщение от гражданина через Qrtr.ru',
          text: 'Идентификатор объекта: ' + objectId + '\nСообщение пользователя: ' + message
        });
      }
    } catch (error) {
      console.error(error);
      throw(error);
    }
    return true
  },
  'links.insert'(title, url) {
    check(url, String);
    check(title, String);

    return Links.insert({
      url,
      title,
      createdAt: new Date(),
    });
  },
});
