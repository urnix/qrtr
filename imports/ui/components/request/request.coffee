require './request.jade'

objectTypes =
  'ek666x36': 'bus'
options =
  'bus': ['Жалоба: водитель курит в салоне', 'Жалоба: водитель пьян']

Template.request.onCreated ->
  @sending = new ReactiveVar(undefined)
  @result = new ReactiveVar(undefined)
  @objectId = FlowRouter.getParam('objectId')
  @objectType = objectTypes[@objectId]
  @message = new ReactiveVar(undefined)

  @autorun =>
    if @objectId and (message = @message.get()) and message isnt ''
      Tracker.nonreactive =>
        @sending.set true
        Meteor.call 'send_email', @objectId, message, (error) =>
          @sending.set false
          if error
            @result.set 'Ошибка. Сообщение не было отправлено.'
            console.error error
          else
            @result.set 'Ваше обращение передано специалисту.'

Template.request.helpers
  selectVisible: ->
    Template.instance().sending.get() is undefined and Template.instance().result.get() is undefined
  objectFound: ->
    Template.instance().objectType isnt undefined
  options: ->
    options[Template.instance().objectType]
  sending: ->
    Template.instance().sending.get()
  result: ->
    Template.instance().result.get()

Template.request.events
  'change #select-messages': (event, template) ->
    template.message.set($(event.currentTarget).val())
