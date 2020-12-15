// This file is a reference of how it should be used JQuery.


// Its important to ask if the document has finished loading the files.
$(document).ready(function(){
  // jQuery methods go here...
  appendCard("Mojito", "Trago rico", true);
  appendCard("Blue Margarita", "azuloide", false);
  appendCard("Caipirinha", "esto es un mojito fake xd", false);
});






function appendCard(name, description, classRecomendation) {
  var classRecomendationText = ((classRecomendation) ? "bg-warning" : "");

  var card = '<div class="card '+ classRecomendationText +'"> ' +
                '<img class="card-img-top" src="img/'+ name +'.jpg" alt="Card image" style="width:100%">'+
                '<div class="card-body">'+
                  '<h4 class="card-title">'+ name +'</h4>'+
                  '<p class="card-text">'+ description +'</p>'+
                  '<a href="#" class="btn btn-primary stretched-link">Ordenar</a>'+
                '</div>'+
              '</div>';
  $("#MainCardColumns").append(card);
}

// <div class="card bg-warning">
//   <img class="card-img-top" src="img/mojito.jpg" alt="Card image" style="width:100%">
//   <div class="card-body">
//     <h4 class="card-title">Mojito</h4>
//     <p class="card-text">Trago tropical que tiene jeje</p>
//     <a href="#" class="btn btn-primary stretched-link">Ordenar</a>
//   </div>
// </div>
