import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropzone"
export default class extends Controller {
  static targets = ["input", "zone", "message"]

  connect() {
    this.zoneTarget.addEventListener("dragover", this.preventDefault.bind(this))
    this.zoneTarget.addEventListener("drop", this.handleDrop.bind(this))
  }

  preventDefault(event) {
    event.preventDefault()
  }

  handleDrop(event) {
    event.preventDefault()
    const files = event.dataTransfer.files
    const dt = new DataTransfer()
    for (let file of files) {
      dt.items.add(file)
    }
    this.inputTarget.files = dt.files
    this.messageTarget.textContent = `${files.length} files selected`
  }

  click() {
    this.inputTarget.click()
  }
}
