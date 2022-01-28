import $, { data } from 'jquery';
import 'select2';

const initSelect2 = () => {


  $(".select2").select2({
    theme: "material",
    placeholder: "Ajouter un métier",
    allowClear: true,

  });

                //  element.value
                // finir le pb du placeholder et essayer denvoyer la variable au controller ou a la vue
                            // finir requete post pour recup le params du placeholder voir ou sa mene

}






export { initSelect2 };
