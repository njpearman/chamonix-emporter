import Map from './map'

class TakeawayLocations {
  constructor(locations) {
    this.locations = locations
  }
}

class Geolocation {
  constructor() {
    this.message = ''
  }

  getLocation() {
    return new Promise(resolve => {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
          this.showPosition(position)
          resolve('resolved')
        }, error => {
          this.showError(error)
          resolve('resolved')
        })
      } else {
        this.message = "Geolocation is not supported by this browser."
      }
    })
  }

  showPosition(position) {
    this.message = `Latitude: ${position.coords.latitude}, Longitude: ${position.coords.longitude}`
    this.latitude = position.coords.latitude
    this.longitude = position.coords.longitude
  }

  showError(error) {
    switch(error.code) {
      case error.PERMISSION_DENIED:
        this.message = "User denied the request for Geolocation or no secure connection."
        break
      case error.POSITION_UNAVAILABLE:
        this.message = "Location information is unavailable."
        break
      case error.TIMEOUT:
        this.message = "The request to get user location timed out."
        break
      case error.UNKNOWN_ERROR:
        this.message = "An unknown error occurred."
        break
    }
 }

  print() {
    console.log(`Result of getting location: ${this.message}`)
  }
}

console.log("Hello, takeaway!")
console.log("Key is: " + process.env.GOOGLE_MAPS_KEY)

const chamonixValley = { lat: 45.917474, lng: 6.856516 }

const map = new Map("map", chamonixValley)
const geo = new Geolocation()

map.addPreparedCallback(function setMarkers() {
  const vendors = document.querySelectorAll('.vendor')

  const image = {
    url: '/assets/pin.svg',
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

const start = () => {
  map.prepare()

  const nearBtn = document.getElementById('sortNearest')
  nearBtn.addEventListener('click', function getCoords(evt) {
    evt.preventDefault()
    this.classList.add('loading')
    geo.getLocation()
      .then(() => geo.print())
      .then(() => this.classList.remove('loading'))
      // Reload page with coors and let ruby do the work or filter with JS?
      .then(() => {
        const latLng = new google.maps.LatLng(geo.latitude, geo.longitude)
        // Drop a pin at the user location
        const marker = new google.maps.Marker({
          position: latLng,
          map: map.mapRepresentation,
          draggable: true,
          title: 'This is you!',
        })
        // Create a 1km circle around the user
        const bufferCircle = new google.maps.Circle({
          center: latLng,
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
      })
  })
}

document.addEventListener("turbolinks:load", start)
