import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onEnd: (evt) => {
        const photoIds = Array.from(this.element.querySelectorAll('[data-id]')).map(el => el.dataset.id)
        const hidden = this.element.closest('form').querySelector('input[name="gallery[photo_order]"]')
        if (hidden) {
          hidden.value = photoIds.join(',')
        }
      }
    })
  }
}
