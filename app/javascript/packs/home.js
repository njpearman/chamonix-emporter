import Map from './map'
import DistanceCalculator from './distanceCalculator'
import PinImage from '../images/pin.svg'
import { chamonixValley } from './geolocation'

console.log("Hello, takeaway!")
console.log("Key is: " + Constants.GOOGLE_MAPS_KEY)

const map = new Map("map", chamonixValley)

map.addPreparedCallback(function setMarkers() {
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
      map.mapRepresentation.setZoom(15)
      map.mapRepresentation.setCenter(marker.getPosition())
      // Scroll to and hightlight vendor?
      // Add popup?
    })
  })
})

let distanceCalculator = new DistanceCalculator(chamonixValley)

const initialDistances = () => {
	document.querySelectorAll('.vendor').forEach(vendor => {
    const distance = distanceCalculator.distanceTo(JSON.parse(vendor.dataset.position))
    vendor.dataset.distance = distance
		console.log(`${vendor.dataset.name} is ${vendor.dataset.distance} from Chamonix`)
	})
}

const start = () => {
  map.prepare()
}

document.addEventListener("turbolinks:load", start)
document.addEventListener("turbolinks:load", initialDistances)
