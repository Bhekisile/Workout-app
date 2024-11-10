import consumer from "./consumer"

console.log("messages_channel.js loaded");

  consumer.subscriptions.create("MessagesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    const roomId = $("#chat-box").data("room-id");
    this.checkIn(roomId);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    
    $("#chat-box").append(data);
    $("#message-field").val('');

    const posts = $(".message-row").length;
    if (posts > 10) {
      $(".message-row").slice(10).remove();
      // $("message-row).first().remove();
    }
  },

  checkIn(roomId) {
    if (roomId) {
      this.perform('checkIn', { room_id: roomId });
    } else {
      this.perform('checkOut');
    }
  }
});
