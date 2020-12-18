// This file is a reference of how it should be used JQuery.


// Its important to ask if the document has finished loading the files.
$(document).ready(function(){
  // Acá hay que poner la barra de carga
  let sql = {msg : "SELECT * FROM cat"};
  addElement(sql);
});

// $("button").click(function(){
//
// });

// $("#nav").click(function(){
//   $(".link-text").css("display", "inline");
// });




function queryDB(sql, callback) {
  $.post("/query", sql, callback);
}

function addElement(sql){
  queryDB(sql, function (res) {
    for (var i = 0; i < res.data.length; i++){
      appendCard(res.data[i].idCat , res.data[i].nombre, "Prueba", true);
    }


  });
  setTimeout(function (){
    $(".card").animate({
      height: 'toggle'
    });
    $(".card p").hide();
  }, 500);
}

function updateContainer(id){
  let sql = {msg : 'SELECT trago.* FROM trago INNER JOIN cat ON trago.idCat = cat.idCat WHERE cat.idCat = '+ id +';'};
  $("#MainCardColumns").empty();
  addElement(sql);
}

function appendCard(id, name, description, classRecomendation) {
  var classRecomendationText = ((classRecomendation) ? "bg-warning" : "");


  var card = '<div class="card '+ classRecomendationText +'"" style="display: none;"> ' +
                '<img class="card-img-top" src="img/'+ name +'.jpg" alt="Card image" style="width:100%;">'+
                '<div class="card-body">'+
                  '<h4 class="card-title">'+ name +'</h4>'+
                  '<p class="card-text">'+ description +'</p>'+
                  '<a id="card-'+ id +'" href="#'+ description +'" class="stretched-link"></a>'+

                '</div>'+
              '</div>';
  $("#MainCardColumns").append(card);
  $('#card-'+ id).click(function(){
    updateContainer(id);
  })

}

// <div class="card bg-warning">
//   <img class="card-img-top" src="img/mojito.jpg" alt="Card image" style="width:100%">
//   <div class="card-body">
//     <h4 class="card-title">Mojito</h4>
//     <p class="card-text">Trago tropical que tiene jeje</p>
//     <a href="#" class="btn btn-primary stretched-link">Ordenar</a>
//   </div>
// </div>
