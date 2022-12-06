import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["waitingList"] //, "responseList"]
  static values = { phone: String, id: Number }

  connect() {
    setTimeout(() => {
      this.insertInList()
    }, 2000);
  }

  insertInList() {

    let formData = new FormData()
    formData.append('phone_number', this.phoneValue)
    formData.append('ride_id', this.idValue)

    // Cria uma notify (notify controller)

    fetch("/notifies", {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: formData
    })
    // .then(response => response.json())
    // .then((data) => {
    //   this.responseListTarget.insertAdjacentHTML('beforeend', `<p>${data.message}</p>`)
    // })
    // O que essas linhas 28-29-30 fazem?

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>We are looking for nearby drivers ...</h4></div>");
    }, 4000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Wait a moment, please</h4></div>");
    }, 6000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Your <strong>ride</strong> is being gerated</h4></div>");
    }, 8000);
  }
}
