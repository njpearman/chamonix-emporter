import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "vendors", "result" ]

  connect() {
    console.log("Sort controller connected ... ")
  }

  nearest() {
    console.log("Sorting by nearest. Found " + this.resultTargets.length + " results")
    // get an list of results, ordered by distance
    const orderedResults = this.resultTargets.sort(this.compareNearest)
    // iterate the ordered list, re-appending them to vendorsTarget
    orderedResults.forEach(result => {
      this.vendorsTarget.append(result)
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
}
