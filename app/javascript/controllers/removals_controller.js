import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  remove(){
    console.log("animationend fired for:", this.element)
    this.element.remove()
  }
}
