export const chamonixValley = { lat: 45.917474, lng: 6.856516 }

export default class Geolocation {
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
    this.message = 'Error retrieving geo coordinates; using default of Chamonix. '
    this.latitude = chamonixValley.lat
    this.longitude = chamonixValley.lng

    switch(error.code) {
      case error.PERMISSION_DENIED:
        this.message += "User denied the request for Geolocation or no secure connection."
        break
      case error.POSITION_UNAVAILABLE:
        this.message += "Location information is unavailable."
        break
      case error.TIMEOUT:
        this.message += "The request to get user location timed out."
        break
      case error.UNKNOWN_ERROR:
        this.message += "An unknown error occurred."
        break
    }
  }

  print() {
    console.log(`Result of getting location: ${this.message}`)
  }
}

