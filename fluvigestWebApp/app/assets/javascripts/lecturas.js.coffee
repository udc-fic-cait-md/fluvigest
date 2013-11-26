# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleFilterForm = ->
   div = document.getElementById("filter_form")
   if div.style.display == "table"
      div.style.display = "none" 
   else
      div.style.display = "table" 

###
// EQUIVALE A:
function toggleFilterForm(){
   div = document.getElementById("filter_form");
   if (div.style.display == "none") {
      div.style.display == "table";
   } else div.style.display == "none";
}
// El codigo resultante no es exactamente este.
// Pero puede usarse igualmente para un elemento
// dentro del html en su metodo onClick()
// Ejemplo:
// <a onClick="toggleFilterForm()">Filtrar resultados</a>
// <table id="filter_form"> ... </table>
###