import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("CommunityChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    return alert(data['message']);
  },

  // これが実行されるとコンシューマになったCommunityChannel#speak({ message: message })が呼ばれる
  speak: function(message) {
    alert("アラート"+ message)
    return this.perform('speak', {
      message: message
    });
  }
});

$(document).on('keypress', '[data-behavior~=community_speaker]', function(event) {
  if (event.key === 'Enter') {
    alert("エンター押下")
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});