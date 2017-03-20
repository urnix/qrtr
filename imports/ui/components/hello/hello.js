import './hello.html';

Template.hello.onCreated(function helloOnCreated () {
  let self = this;
  this.result = new ReactiveVar(undefined);
  let objectId = FlowRouter.getParam('objectId');
  let message = FlowRouter.getParam('message');

  if (objectId && message) {
    Meteor.call('send_email', objectId, message, (error) => {
      if (error){
        self.result.set('Ошибка. Сообщение не было отправлено.');
        console.error(error)
      } else {
        self.result.set('Ваше обращение передано специалисту.');
      }
    });
  } else {
    self.result.set('Неверная ссылка.')
  }
});

Template.hello.helpers({
  result() {
    return Template.instance().result.get();
  }
});
