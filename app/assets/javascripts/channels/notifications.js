App.cable.subscriptions.create({channel: "NotificationsChannel"}, {
  received: function(data){
    $('#notificationList').prepend(data.notification)
    this.update_counter();
  },

  update_counter: function(){

    var num = parseInt($('#notification-counter').text());

    return num ++;

  }

});
