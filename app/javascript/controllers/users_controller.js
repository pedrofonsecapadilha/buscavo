import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["waitingList", "responseList"]

  connect() {

    console.log("users_controller")

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>We are looking for nearby drivers ...</h4></div>");
    }, 2000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Wait a moment, please</h4></div>");
    }, 4000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Your <strong>ride</strong> is being gerated</h4></div>");
    }, 6000);

    setTimeout(() => {
      this.responseListTarget.insertAdjacentHTML('beforeend',
      "<div class='row d-flex justify-between'><div class='col-6'><div class='card m-5' style='width: 30rem;' id='ride'><div class='card-body'><h5 class='card-title'>Phone-number: <strong>+55 11 9-8765-4321</strong></h5><h6 class='card-subtitle mb-2 text-muted'>Friday, 2022 Dec 02</h6><p class='card-text mb-3'>Name: Dona Alice</p><a href='#' class='card-link btn btn-primary'>Accept Ride</a><a href='#' class='card-link btn btn-primary'>Cancel</a></div></div></div></div>")
    }, 8000);

  }
}
