# Import server startup through a single index entry point

require './fixtures.coffee'
require './register-api.coffee'

{Meteor} = require 'meteor/meteor'

process.env.MAIL_URL = Meteor.settings.mailUrl
