import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["waitingList"]
  connect() {

    console.log("users_controller")

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Calling drivers near by</p>');
    }, 2800);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Wait a moment, please</p>');
    }, 4600);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Your trip is being gerated 🚕</p>');
    }, 6000);

  }
}
