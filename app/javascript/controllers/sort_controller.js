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
    // Hack(?) to access the map
    const { map } = this.application.controllers.find(controller => (
      controller.context.identifier === 'map'
    ))
    const geo = this.geo

    geo.getLocation()
      .then(() => geo.print())
      // Reload page with coors and let ruby do the work or filter with JS?
      .then(() => {
        const centre = new google.maps.LatLng(geo.latitude, geo.longitude)
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
          // recalculate distances, re-order nearest
          //   This conflicts with pressing "nearest" a second time, as
          //   geo will be reset, and a new marker and radius circle will
          //   be drawn on the map.
          //   Also, the location is reset and the map redrawn when a filter
          //   is applied.
          this.geo.setLocation(event.latLng.lat(), event.latLng.lng())

          new DistanceCalculator({ lat: this.geo.latitude, lng: this.geo.longitude })
            .distancesForEach('.vendor')
            .then(() => this.sortList())
        })

        // now need to calculate distances of each vendor from the geo location
        new DistanceCalculator({ lat: geo.latitude, lng: geo.longitude })
          .distancesForEach('.vendor')
          .then(() => this.sortList())
      })
  }

  sortList() {
    // do the sorting of the list
    console.log("Sorting by nearest. Found " + this.resultTargets.length + " results")
    // get an list of results, ordered by distance
    const orderedResults = this.resultTargets.sort(this.compareNearest)
    // iterate the ordered list, re-appending them to vendorsTarget
    orderedResults.forEach(result => this.vendorsTarget.append(result))
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
}
