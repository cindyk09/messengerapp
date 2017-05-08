$(document).on('turbolinks:load', function() {
  notificationOpen();
  notificationHide();
  notificationContainer();
});


function notificationOpen(){
  // open notification center on click
  $("#open_notification").click(function()
  {
    $("#notificationContainer").fadeToggle(300);
    $("#notification_count").fadeOut("fast");
    return false;
  });
}

function notificationHide(){
  // hide notification center on click
  $(document).click(function()
  {
    $("#notificationContainer").hide();
  });
}

function notificationContainer(){
  $("#notificationContainer").click(function()
  {
    return false;
  });
}
