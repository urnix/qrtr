require './request.jade'

Template.request.onCreated ->
  self = this
  @result = new ReactiveVar(undefined)
  objectId = FlowRouter.getParam('objectId')
  message = FlowRouter.getParam('message')
  if objectId and message
    Meteor.call 'send_email', objectId, message, (error) ->
      if error
        self.result.set 'Ошибка. Сообщение не было отправлено.'
        console.error error
      else
        self.result.set 'Ваше обращение передано специалисту.'
      return
  else
    self.result.set 'Неверная ссылка.'
  return

Template.request.helpers result: ->
  Template.instance().result.get()
