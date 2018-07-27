import $ from 'jquery';
function newCocktail (){

  const swalButton = document.getElementById('swal-form');
  if (swalButton) {
    swalButton.addEventListener('click', (e) => {
      e.preventDefault();
      swal( {
        title: "What's the name of the cocktail?",
        content: "input",
        buttons: ["no", "yes"]
        // buttons: {
        //   cancel: "cancel",
        //   text: "Add",
        //   closeModal: false,
        // },
      })
      .then((value) => {
        console.log(value);
        if (value != null && value != 'cancel') {
          $.ajax({
            type:    "POST",
            url:     "/cocktails",
            data:    { name: value },
            success: function(post){ console.log('success') },
            error:   function(post){ console.log(this) }
          })
          swal({
            title: "Good job!",
            text: "You add the cocktail!",
            icon: "success",
            button: "Aww yiss!",
          });
        }

      });

    });
  }
}

export { newCocktail }
