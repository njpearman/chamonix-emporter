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
    if(!this.mapsScriptLoaded) {
      var script = document.createElement('script')
      script.src = `https://maps.googleapis.com/maps/api/js?key=${process.env.GOOGLE_MAPS_KEY}&libraries=places&callback=mapsReady`
      script.type = 'text/javascript'
      script.setAttribute('async', null)
      script.setAttribute('defer', null)
      const prepared = this.prepared.bind(this)
      window.mapsReady = () => {
        prepared()
      }
      document.getElementsByTagName('body')[0].appendChild(script)
      this.mapsScriptLoaded = true
    }
  }

  build() {
    const container = document.getElementById(this.containerId)
		this.mapRepresentation = new google.maps.Map(container, {
			zoom: 12,
			center: this.centreOn,
			styles: this.style()
		})

    container.style.height = '25rem';
	}

  style() {
		return [
      {
        "featureType": "poi.attraction",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ]
    //   {
    //     "featureType": "water",
    //     "stylers": [
    //         { "visibility": "on" },
    //         { "color": "#b5cbe4" }
    //       ]
    //     },
    //     {
    //       "featureType": "landscape",
    //       "stylers": [
    //         { "color": "#efefef" }
    //       ]
    //     },
    //     {
    //       "featureType": "road.highway",
    //       "elementType": "geometry",
    //       "stylers": [
    //         { "visibility": "off" }
    //       ]
    //     },
    //     {
    //       "featureType": "road.arterial",
    //       "elementType": "geometry",
    //       "stylers": [
    //         { "color": "#bdcdd3" }
    //       ]
    //     },
    //     {
    //       "featureType": "road.local",
    //       "elementType": "geometry",
    //       "stylers": [
    //         { "color": "#ffffff" }
    //       ]
    //     },
    //     {
    //       "featureType": "poi.park",
    //       "elementType": "geometry",
    //       "stylers": [
    //         { "color": "#e3eed3" }
    //       ]
    //     },
    //     {
    //       "featureType": "administrative",
    //       "stylers": [
    //         { "visibility": "on" },
    //         { "lightness": 45 }
    //       ]
    //     },
    //     {
    //       "featureType": "road",
    //       "elementType": "labels",
    //       "stylers": [
    //         {"visibility": "off"}
    //       ]
    //     },
    //     {
    //       "featureType": "poi",
    //       "elementType": "labels",
    //       "stylers": [
    //         { "visibility": "off" }
    //       ]
    //     },
    //     {
    //       "featureType": "road",
    //       "stylers": [
    //         { "lightness": 20 }
    //       ]
    //     }
    //   ]
  }
}
