import $, { data } from 'jquery';
import 'select2';

const initSelect2 = () => {


  $(".select2").select2({
    theme: "material",
    placeholder: "Ajouter un métier",
    allowClear: true,

  });

  const input = document.querySelectorAll('.form-control');

  if (input) {
    let i = 0
    input.forEach((element) => {
      i++
        element.addEventListener("keyup", (e) => {
            e.preventDefault();
            if (i != 1) {
            if (e.currentTarget.value != "" ) {
              // console.log(element.placeholder);
              e.currentTarget.placeholder = e.currentTarget.value;
                //  element.value
                // finir le pb du placeholder et essayer denvoyer la variable au controller ou a la vue
                            // finir requete post pour recup le params du placeholder voir ou sa mene
              fetch("/new_offer", {
                method: "POST",
                headers: { "Content-Type": "application/json"  },
                body: JSON.stringify({ titletest: e.currentTarget.value })
              })
                .then(response => response.json())
                .then((data) => {
                  console.log(data.url)
                })




            }
          }

        });
    });

}



};



export { initSelect2 };
