// Import server startup through a single index entry point

import './fixtures.js';
import './register-api.js';

import {Meteor} from 'meteor/meteor'

process.env.MAIL_URL = Meteor.settings.mailUrl;
