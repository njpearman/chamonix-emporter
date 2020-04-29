import { Controller } from "stimulus"
import DistanceCalculator from '../packs/distanceCalculator'
import Geolocation from '../packs/geolocation'

export default class extends Controller {
  static targets = [ "vendors", "result" ]

  initialize() {
    console.log("Sort controller instantiated ... ")
    this.geo = new Geolocation()
  }

  connect() {
    console.log("Sort controller connected ... ")
  }

  nearest() {
    const geo = this.geo
    let centre = {}

    // this.classList.add('loading')
    geo.getLocation()
      .then(() => geo.print())
      // .then(() => this.classList.remove('loading'))
      // Reload page with coors and let ruby do the work or filter with JS?
      .then(() => {
        centre = new google.maps.LatLng(geo.latitude, geo.longitude)
        // Drop a pin at the user location
        const marker = new google.maps.Marker({
          position: centre,
          map: map.mapRepresentation,
          draggable: true,
          title: 'This is you!',
        })
        // Create a 1km circle around the user
        const bufferCircle = new google.maps.Circle({
          center: centre,
          radius: 1000, // meters
          strokeColor: "#61a0e9",
          strokeOpacity: 1,
          strokeWeight: 1,
          fillColor: "#61a0e9",
          fillOpacity: 0.4,
          map: map.mapRepresentation
        })

        // Move the circle after moving the pin
        google.maps.event.addListener(marker, "dragend", (event) => {
          bufferCircle.setCenter(event.latLng)
        })

        // now need to calculate distances of each vendor from the geo location
        let distanceCalculator = new DistanceCalculator({ lat: geo.latitude, lng: geo.longitude })

        document.querySelectorAll('.vendor').forEach(vendor => {
          const distance = distanceCalculator.distanceTo(JSON.parse(vendor.dataset.position))
          vendor.dataset.distance = distance
          console.log(`${vendor.dataset.name} is ${vendor.dataset.distance} from Chamonix`)
        })
      })
    .then(() => {
      // do the sorting of the list
      console.log("Sorting by nearest. Found " + this.resultTargets.length + " results")
      // get an list of results, ordered by distance
      const orderedResults = this.resultTargets.sort(this.compareNearest)
      // iterate the ordered list, re-appending them to vendorsTarget
      orderedResults.forEach(result => {
        this.vendorsTarget.append(result)
      })
    })
  }
  
  compareNearest(first, second) {
    const firstDistance = first.dataset.distance
    const secondDistance = second.dataset.distance

    if (firstDistance > secondDistance) {
      return 1
    } else if (firstDistance < secondDistance) {
      return -1
    } else {
      return 0
    }
  }

  getCurrentLocation() {
    const geo = new Geolocation()
    const nearBtn = document.getElementById('sortNearest')
    nearBtn.addEventListener('click', function getCoords(evt) {
      evt.preventDefault()
    })
  }
}
