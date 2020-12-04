// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import ax from 'axios'

export default class extends Controller {
  static targets = [ "icon" ]

  go(e){
    e.preventDefault();
    const id =this.data.get('id');
    const token = document.querySelector('[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-TOKEN'] = token

    ax.post(`/posts/${id}/favorite`, {})
      .then((resp) => {
        if (resp.data.status == "added") {
          this.iconTarget.classList.add('fas')
          this.iconTarget.classList.remove('far')      
        } else {
          this.iconTarget.classList.add('far')
          this.iconTarget.classList.remove('fas')      
        }
        console.log(resp.data);
      })
      .catch(function(err) {
        console.log(err);
      })

  }
}
