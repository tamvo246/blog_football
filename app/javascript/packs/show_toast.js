// custom_toast.js
document.addEventListener('DOMContentLoaded', function() {
  if (flashMessages.success) {
    showToast(flashMessages.success, "success");
  }

  if (flashMessages.error) {
    showToast(flashMessages.error, "error");
  }

  // Add other types of flash messages if needed
});

function showToast(message, type) {
  Toastify({
    text: message,
    duration: 3000, // Duration in milliseconds (3 seconds in this example)
    close: true,    // Show close button
    gravity: "top", // Toast position (top, bottom, left, right)
    position: "right", // Toast position (top, center, bottom, left, right)
    backgroundColor: type === "success" ? "#4caf50" : "#f44336", // Background color based on the type (success or error)
  }).showToast();
}
