App.cable.subscriptions.create({channel: "NotificationsChannel"}, {
  received: function(data){
    debugger;
    $('#notificationList').prepend(data.notification)
    this.update_counter();
  },

  update_counter: function(){
    debugger;
    var num = $('#notification-counter');
      setInterval(function () {
        var value = parseInt num;
        value++;
        num = value;
      });

  }

});
