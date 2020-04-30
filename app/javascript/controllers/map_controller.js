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

      const image = {
        url: PinImage,
        scaledSize: new google.maps.Size(16, 29),
        origin: new google.maps.Point(0, 0),
      };

      vendors.forEach(vendor => {
        console.log(`Marking up ${vendor.dataset.name} with position ${vendor.dataset.position}`)
        const parsedPosition = JSON.parse(vendor.dataset.position)
        const marker = new google.maps.Marker({
          position: new google.maps.LatLng(parsedPosition.lat, parsedPosition.lng),
          map: this.mapRepresentation,
          title: vendor.dataset.name,
          icon: image
        })

        marker.addListener('click', () => {
          this.mapRepresentation.setZoom(15)
          this.mapRepresentation.setCenter(marker.getPosition())
          // Scroll to and hightlight vendor?
          // Add popup?
        })
      })
    })
  }

  connect() {
    this.map.prepare()
  }
}
