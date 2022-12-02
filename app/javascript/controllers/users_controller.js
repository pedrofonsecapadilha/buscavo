import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["waitingList", "responseList"]

  connect() {

    console.log("users_controller")

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Calling drivers near by</p>');
    }, 2000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Wait a moment, please</p>');
    }, 4000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend', '<p>Your trip is being gerated 🚕</p>');
    }, 6000);

    setTimeout(() => {
      this.responseListTarget.insertAdjacentHTML('beforeend',
      "<div class='card my-3' style='width: 18rem;' id='ride'18><div class='card-body'><h5 class='card-title'><strong>987654321</strong></h5><h6 class='card-subtitle mb-2 text-muted'></h6><p class='card-text'>Viagem da Dona Alice</p><a href='#' class='card-link'>Card link</a><a href='#' class='card-link'>Another link</a></div></div>"
       );
    }, 8000);

  }
}
