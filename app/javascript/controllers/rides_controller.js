import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="rides"
export default class extends Controller {
  static targets = ["responseList"]
  static values = { phone: String, id: Number }

  connect() {
    console.log("rides_controller")

    this.channel = createConsumer().subscriptions.create(
      { channel: "RidesChannel", id: this.idValue },
      { received: data => console.log(data) }
    )

    setTimeout(this.insertInList(), 800);
  }

  insertInList(){

    console.log('fetch trip')

    let formData = new FormData()
    formData.append('phone_number', this.phoneValue)
    formData.append('ride_id', this.idValue)

    fetch("/rides", {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: formData
    })
    .then(response => response)
    // .then((data) => {
    //   console.log(data)
    //   this.responseListTarget.insertAdjacentHTML('beforeend', `<p>${data}</p>`)
    // })
  }
}
