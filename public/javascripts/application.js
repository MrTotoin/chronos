// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function () {  
      setTimeout(refresca_estado, 1000);  
  });  
  
function refresca_estado() {  
  var entrenamiento_id = $('#test_id').attr('data-id')	
  $.getScript('/wait.js?entrenamiento_id=' + entrenamiento_id);  
  setTimeout(refresca_estado, 1000);  
}

//este codigo llama al script wait.js dentro de views/entrenamientos. Hay que buscar la manera de que estas lineas solo se ejecuten en el entrenamientos/show.html.erb