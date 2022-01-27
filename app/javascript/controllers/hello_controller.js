// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { jobClick } from "./seehideform"
import { jobClickSkill } from "./seehide";

export default class extends Controller {
  static targets = ["formulaire", "button", "liste"];
  connect() {
  }

  update() {
    const url = `${this.formulaireTarget.action}?query=${this.buttonTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.listeTarget.outerHTML = data;

      jobClick()
      jobClickSkill()

      })
  }

}
