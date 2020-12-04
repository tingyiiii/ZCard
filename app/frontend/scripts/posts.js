window.addEventListener('DOMContentLoaded', function() {
  const favorite_btn = document.getElementById('favorite_btn');

  if (favorite_btn) {
    favorite_btn.addEventListener('click', function(e){
      e.preventDefault();
      const ax = require('axios');
      const postId = e.currentTarget.dataset.id

      const token = document.querySelector('[name=csrf-token]').content
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token

      ax.post(`/posts/${postId}/favorite`, {})
        .then(function(resp) {
          console.log(resp);
        })
        .catch(function(err) {
          console.log(err);
        })
      document.querySelector('#favorite_btn i').classList.toggle('fas')
      document.querySelector('#favorite_btn i').classList.toggle('far')
    })
  }
})