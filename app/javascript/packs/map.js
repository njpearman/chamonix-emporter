export default class Map {
  constructor(containerId, centreOn) {
    this.containerId = containerId
    this.centreOn = centreOn
    this.preparedCallbacks = []
    this.addPreparedCallback(this.build)
	}

  addPreparedCallback(callback) {
    this.preparedCallbacks.push(callback.bind(this))
  }

  prepared() {
    this.preparedCallbacks.forEach(callback => callback())
  }

  prepare() {
    if(typeof(google) !== 'undefined' && typeof(google.maps) !== 'undefined') {
      this.prepared()
    } else {
      const script = document.createElement('script')
      script.src = `https://maps.googleapis.com/maps/api/js?key=${Constants.GOOGLE_MAPS_KEY}&libraries=places&callback=mapsReady`
      script.type = 'text/javascript'
      script.setAttribute('async', null)
      script.setAttribute('defer', null)
      const prepared = this.prepared.bind(this)
      window.mapsReady = () => {
        console.log("google maps script loaded")
        prepared()
      }

      document.getElementsByTagName('head')[0].appendChild(script)
    }
  }

  build() {
    if (this.mapLoaded()) {
      return
    }

    const container = document.getElementById(this.containerId)

		this.mapRepresentation = new google.maps.Map(container, {
			zoom: 12,
			center: this.centreOn,
			styles: this.style()
		})

    container.style.height = '19rem';
	}
  
  mapLoaded() {
    return this.mapRepresentation && this.mapRepresentation.mapTypeId
  }

  style() {
		return [
      {
        "featureType": "poi.attraction",
        "stylers": [ { "visibility": "off" } ]
      }
    ]
  }
}
