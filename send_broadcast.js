// npm install axios
const axios = require('axios');

const token = 'ya29.c.c0ASRK0GbmijXvA-GJRHN5pPrU2_0hMSBBrHSdKGlg7UnOVLGuaEuC_tq7pIRzn2O9o1YGsAJ33-jmjkh1A15nW8Kc3wK51JkXLdHL_7OM46Y1rWqzbNe6dYAfEAiFvAmV5Khln173Tc7Sr0Q-MfJfFYkkHt9GvAUjzDL5JrLYvV2CyUrrus1AKXrudczQIPtUcVDnxu6vEUpTx4plgRwmrLU31McOMz9umwrZUOIVPN2-46b-JTAUhxK69NzlKQqWttlldmCVHoNsWoS_1uJjuelJZDW8vSsrgq4ow_IxrhScZIxl34PpPPOF6V5x1HaNzNPQHoSZ7I2TaGNTzmtgHnt_rnLaA8c0_L7MJ2_zwooY1_RUb6YB2f4yXAL387PBzaVMv0lhFWkro93gFu_8tZ1elJgZcqBIldBz1J8z5vlYF3gyOpy1B_onocbrivXYdFooFZv5ljVQJa-8v0dfIvZFy4nhhylaF554zUimMhwZo0V2fF9cqfsjpY5xkzmtd4UvSkYk-mMd7lUtZncwyeBxUIfZzbJY2cafkl-wzFxQi7Zd_njmJMWwIUwa_lc3jWVzI8dRQUfqqfFR35j0Wmvz_aMsOmJObg2l7J_UuFqjrn7B6I3XXtvt65XdnYcyRu63Bf8az1rhMFzugi--f3awgjmt_jXSnUVwuShyv-8ttpghYwQ_q_SV9mnB2xQ5BmJq7Iadz92QYu_ySlk5eJ5z9MImqj35-O6Bje02_uwcjyQnd1wec3lo7yY7z5F-yYuFg-jwZMxqVu-5k35J_MxrqI6cV7YozcX-9kFZct5byfjdhhk2M55R9y5jyVy8bvocbWs8y1kSFqFv6VhYO94WzYi5xYUyW04og-bwpUXxoU53ZSoc8dp4bsWIzek_Qz3BmcZ2jun4mZgM_ae30vVI9_orgqU1dfa2xjBh-6l1ovguu-d3fI1vVjeJWRdql6uocgVUFdfd-x_v0X8BBwZBst8eF41XcYVe9mjMjkUyFocQx_tBnqs'; // Replace with your generated token

const url = 'https://fcm.googleapis.com/v1/projects/aag4u-5878f/messages:send';

const messagePayload = {
  message: {
    topic: "all",
    notification: {
      title: "Broadcast Notification",
      body: "This message is sent to all devices!"
    },
    data: {
      type: "chat" // Used for navigation
    },
    android: {
      priority: "high",
      notification: {
        channel_id: "high_importance_channel"
      }
    }
  }
};

const headers = {
  'Authorization': `Bearer ${token}`,
  'Content-Type': 'application/json'
};

axios.post(url, messagePayload, { headers })
  .then(response => {
    console.log('Message sent successfully:', response.data);
  })
  .catch(error => {
    console.error('Error sending message:', error.response ? error.response.data : error.message);
  });