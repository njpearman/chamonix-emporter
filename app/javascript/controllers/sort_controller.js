import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Sort controller connected ... ")
  }

  nearest() {
    console.log("Sorting by nearest")
  }
}
