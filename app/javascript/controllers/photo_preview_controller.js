import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["img", "photoInput"]
  connect() {
    console.log('ici')
  }

  displayPreview(event){
    if (this.photoInputTarget.files && this.photoInputTarget.files[0]) {

      const reader = new FileReader()
      reader.onload = (event) => {
        this.imgTarget.src = event.currentTarget.result
        this.imgTarget.classList.remove("d-none")
        if (this.hasDeleteIconTarget) {
          this.deleteIconTarget.classList.remove("d-none")
        }
      }
      reader.readAsDataURL(this.photoInputTarget.files[0])
    }
  }
}
