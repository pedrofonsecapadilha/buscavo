import { Controller } from "@hotwired/stimulus"
let rideLocation = null
let map = undefined
let fitMarkers = null
let wazeLink = null
let driverLocation = {latitude: "", longitude: ""}
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  static targets = ["link", "map"]

/*   success(position) {
    console.log(position.coords.latitude)
  } */

  error() {
    console.log('Please enable geolocation Services')
    document.querySelector('[data-map-target="text"]').innerHTML = "Por favor, habilite os serviços de localização do seu navegador!"
  }
  #wazeLink(){
    document.querySelector('[data-map-target="link"]').attributes.href.value = `https://www.waze.com/pt-BR/live-map/directions?q=navigate%3Dyes&to=ll.${ rideLocation[0].lat }%2C${ rideLocation[0].lng }&from=ll.${ driverLocation.latitude }%2C${ driverLocation.longitude }`;
  }

  #fitMapToMarkers(){
    const bounds = new mapboxgl.LngLatBounds()
    rideLocation.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0 })
  }
  connect() {
    rideLocation = this.markersValue
    navigator.geolocation.getCurrentPosition(this.#addMarkersToMap, this.error)
    mapboxgl.accessToken = this.apiKeyValue

    this.mapTarget.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1",
    })

    map = this.mapTarget.map

    fitMarkers = this.#fitMapToMarkers

    console.dir(this.linkTarget.attributes)

    wazeLink = this.#wazeLink

  }


  #addMarkersToMap(position) {
     driverLocation.latitude = position.coords.latitude
     driverLocation.longitude = position.coords.longitude
     wazeLink()
     rideLocation.forEach((marker) => {

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map)

    })

    const driverMarker = document.createElement("div")
    driverMarker.className = "marker"
    driverMarker.style.backgroundImage = `url('https://media.istockphoto.com/id/926132074/pt/vetorial/car-icon.jpg?s=612x612&w=0&k=20&c=Lokre67k5UWfAkAJgVph5O6akYmRJnfTQjoozLy5EWM=')`
    driverMarker.style.backgroundSize = "contain"
    driverMarker.style.width = "55px"
    driverMarker.style.height = "55px"
    driverMarker.style.mixBlendMode = "color-burn"

      new mapboxgl.Marker(driverMarker)
      .setLngLat([position.coords.longitude, position.coords.latitude])
      .addTo(map)
    fitMarkers()

    }

  }
