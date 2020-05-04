import { Controller } from "stimulus"
import Map from '../packs/map'
import PinImage from '../images/pin.svg'
import { chamonixValley } from '../packs/geolocation'

export default class extends Controller {
  static targets = [ "canvas", "centreLatitude", "centreLongitude" ]

  initialize() {
    this.map = new Map("map", chamonixValley)

    this.map.addPreparedCallback(function setMarkers() {
      const vendors = document.querySelectorAll('.vendor')

      const vendorPin = {
        url: PinImage,
        scaledSize: new google.maps.Size(16, 29),
        origin: new google.maps.Point(0, 0),
      }

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
        }, index * 100)
      })
    })
  }

  connect() {
    this.map.prepare()
  }
}