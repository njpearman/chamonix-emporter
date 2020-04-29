const DISTANCE_BETWEEN_LATITUDE_IN_MILES = 60 * 1.1515
const KILOMETRES_IN_A_MILE = 1.609344

export default class DistanceCalculator {
  constructor(centre) {
    this.centre = centre
  }

  distancesForEach(selector) {
    return new Promise(resolve => {
      document.querySelectorAll(selector).forEach(vendor => {
        const distance = this.distanceTo(JSON.parse(vendor.dataset.position))
        vendor.dataset.distance = distance
        console.log(`${vendor.dataset.name} is ${vendor.dataset.distance} from Chamonix`)
      })
      resolve('resolved')
    })
  }

  distanceTo(position) {
    return this.calculateDistanceBetween(position, this.centre) 
  }

  // Based on the algorithm defined at https://www.geodatasource.com/developers/javascript.
  // As such, this method implementation is licenced under LGPLv3.
  calculateDistanceBetween(position, source) {
    if ((position.lat === source.lat) && (position.lng === source.lng)) {
      return 0
    }

    var radlat1 = Math.PI * position.lat/180
    var radlat2 = Math.PI * source.lat/180
    var theta = position.lng - source.lng
    var radtheta = Math.PI * theta/180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
    if (dist > 1) {
      dist = 1
    }
    return Math.acos(dist) * 180/Math.PI * DISTANCE_BETWEEN_LATITUDE_IN_MILES * KILOMETRES_IN_A_MILE 
  }
}
