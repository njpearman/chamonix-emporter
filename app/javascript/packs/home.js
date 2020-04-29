import DistanceCalculator from './distanceCalculator'
import { chamonixValley } from './geolocation'

console.log("Hello, takeaway!")
console.log("Key is: " + Constants.GOOGLE_MAPS_KEY)

let distanceCalculator = new DistanceCalculator(chamonixValley)

const initialDistances = () => {
	document.querySelectorAll('.vendor').forEach(vendor => {
    const distance = distanceCalculator.distanceTo(JSON.parse(vendor.dataset.position))
    vendor.dataset.distance = distance
		console.log(`${vendor.dataset.name} is ${vendor.dataset.distance} from Chamonix`)
	})
}

document.addEventListener("turbolinks:load", initialDistances)
