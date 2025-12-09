import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bulk-upload"
export default class extends Controller {
  static targets = ["form", "input", "preview", "submit", "progress", "zone", "message"]

  connect() {
    this.updateSubmitButton()
    this.setupDragAndDrop()
  }

  setupDragAndDrop() {
    if (this.hasZoneTarget) {
      this.zoneTarget.addEventListener("dragover", this.handleDragOver.bind(this))
      this.zoneTarget.addEventListener("dragleave", this.handleDragLeave.bind(this))
      this.zoneTarget.addEventListener("drop", this.handleDrop.bind(this))
    }
  }

  handleDragOver(event) {
    event.preventDefault()
    if (this.hasZoneTarget) {
      this.zoneTarget.classList.add("drag-over")
    }
  }

  handleDragLeave(event) {
    event.preventDefault()
    if (this.hasZoneTarget) {
      this.zoneTarget.classList.remove("drag-over")
    }
  }

  handleDrop(event) {
    event.preventDefault()
    if (this.hasZoneTarget) {
      this.zoneTarget.classList.remove("drag-over")
    }

    const files = event.dataTransfer.files
    this.addFiles(files)
  }

  addFiles(files) {
    const dt = new DataTransfer()
    // Add existing files
    if (this.inputTarget.files) {
      for (let file of this.inputTarget.files) {
        dt.items.add(file)
      }
    }
    // Add new files
    for (let file of files) {
      dt.items.add(file)
    }
    this.inputTarget.files = dt.files
    this.updateFileCount()
    this.onFileChange()
  }

  updateFileCount() {
    if (this.hasMessageTarget) {
      const count = this.inputTarget.files ? this.inputTarget.files.length : 0
      if (count === 0) {
        this.messageTarget.textContent = "Drag and drop photos here or click to select"
      } else {
        this.messageTarget.textContent = `${count} photo${count === 1 ? '' : 's'} selected`
      }
    }
  }

  clickZone() {
    this.inputTarget.click()
  }

  updateSubmitButton() {
    const hasFiles = this.inputTarget.files && this.inputTarget.files.length > 0
    this.submitTarget.disabled = !hasFiles
    this.submitTarget.textContent = hasFiles ? `Upload ${this.inputTarget.files.length} photos` : "Select photos to upload"
  }

  onFileChange() {
    this.updateSubmitButton()
    this.updateFileCount()
    this.showPreview()
  }

  showPreview() {
    const files = this.inputTarget.files
    this.previewTarget.innerHTML = ""

    if (files && files.length > 0) {
      for (let i = 0; i < files.length; i++) {
        const file = files[i]
        const reader = new FileReader()

        reader.onload = (e) => {
          const img = document.createElement("img")
          img.src = e.target.result
          img.className = "w-20 h-20 object-cover rounded border"
          img.alt = file.name
          this.previewTarget.appendChild(img)
        }

        reader.readAsDataURL(file)
      }
    }
  }

  async submit(event) {
    // Let Turbo handle the form submission
    this.progressTarget.classList.remove("hidden")
    this.submitTarget.disabled = true
    this.submitTarget.textContent = "Uploading..."
  }

  onSubmitEnd(event) {
    this.progressTarget.classList.add("hidden")
    if (event.detail.success) {
      this.resetForm()
    } else {
      this.updateSubmitButton()
      // Errors are now displayed via Turbo Stream in the upload-errors div
    }
  }

  resetForm() {
    this.formTarget.reset()
    this.previewTarget.innerHTML = ""
    this.updateFileCount()
    this.updateSubmitButton()
  }
}
