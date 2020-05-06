import { Controller } from "stimulus"
import Map from '../packs/map'
import PinImage from '../images/pin.svg'
import { chamonixValley } from '../packs/geolocation'

export default class extends Controller {
  static targets = [ "canvas", "centreLatitude", "centreLongitude" ]

  initialize() {
    console.log("Initializing MapController")

    this.map = new Map("map", chamonixValley)
    this.vendorMarkers = []
    const vendorMarkers = this.vendorMarkers

    this.map.addPreparedCallback(function setMarkers() {
      const vendors = document.querySelectorAll('.vendor')

      const vendorPin = {
        url: PinImage,
        scaledSize: new google.maps.Size(16, 29),
        origin: new google.maps.Point(0, 0),
      }

      vendorMarkers.forEach(marker => marker.setMap(null))

      vendors.forEach((vendor, index) => {
        console.log(`Marking up ${vendor.dataset.name} with position ${vendor.dataset.position}`)
        const parsedPosition = JSON.parse(vendor.dataset.position)

        setTimeout(() => {
          const marker = new google.maps.Marker({
            position: new google.maps.LatLng(parsedPosition.lat, parsedPosition.lng),
            animation: google.maps.Animation.DROP,
            map: this.mapRepresentation,
            title: vendor.dataset.name,
            icon: vendorPin
          })

          marker.addListener('click', () => {
            this.mapRepresentation.setZoom(15)
            this.mapRepresentation.setCenter(marker.getPosition())
            new google.maps
              .InfoWindow({ content: `<strong>${vendor.dataset.name}</strong>`})
              .open(this.mapRepresentation, marker)
          })
          
          vendorMarkers.push(marker)
        }, index * 100)
      })
    })
  }

  connect() {
    console.log("Connected MapController")
    if (!document.documentElement.hasAttribute("data-turbolinks-preview")) {
      this.map.prepare()
    }
  }
}
