import consumer from "./consumer"

console.log("messages_channel.js loaded");

  consumer.subscriptions.create("MessagesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    const roomId = $("#chat-box").data("room-id");
    this.checkIn(roomId);
    console.log("Connected to the chat room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the chat room!");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data:", data)
    const posts = $(".message-row").length;
    if (posts > 10) {
      $(".message-row").first().remove();
    }

    $("#chat-box").append(data);
    $("#message-field").val('');
  },

  checkIn(roomId) {
    if (roomId) {
      this.perform('checkIn', { room_id: roomId });
    } else {
      this.perform('checkOut');
    }
  }
});
