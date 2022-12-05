import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  static targets = ["cordinates"]
  static values = {id:Number}

  connect() {
    const successCallback = (position) => {
      console.log(position);
      this.cordinatesTarget.insertAdjacentHTML("beforeend", position.coords)
    };

    const errorCallback = (error) => {
      console.log(error);
    };

    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
  }

  post(event) {
    let position = navigator.geolocation.getCurrentPosition()
    let formData = new FormData()
    formData.append("latitude", position.coords.latitude)
    formData.append("longitude", position.coords.longitude)
    formData.append('refeer_id', this.idValue)

    fetch("/request", {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: formData
    })
    .then(response => response.json())
    .then((data) => {
    })
  }
}
