// Its important to ask if the document has finished loading the files.
$(document).ready(function(){
  // Acá hay que poner la barra de carga
  let sql = {msg : "SELECT * FROM cat"};
  addElement(sql);

  $('#Pedir').click(function(){
    $("#txtbox-trago").prop('disabled', false);
    $("#exampleModal").modal('toggle');
  });

  $('#btn-ordenar').click(function(){
    var json = {trago: $('#txtbox-trago').val() , nombre: $('#txtbox-nombre').val() };
    $.post("/ordenar", json, function (res){
      alert(res.msg);
    });
    $('#exampleModal').modal('toggle');
  })
});



function addElement(sql){
  queryDB(sql, function (res) {
    for (var i = 0; i < res.data.length; i++){
      appendCard(res.data[i].id , res.data[i].nombre, res.data[i].texto, res.data[i].ingredientes, res.data[i].recomendado);
    }

  });
  setTimeout(function (){
    $(".card").animate({
      height: 'toggle'
    });
    // $(".card p").hide();
  }, 500);
}

function updateContainer(id){
  let sql = {msg : 'SELECT trago.* FROM trago INNER JOIN cat ON trago.idCat = cat.id WHERE cat.id = '+ id +';'};
  $("#MainCardColumns").empty();
  addElement(sql);
}

function appendCard(id, name, description, ingredients,classRecomendation) {
  if (id != null){
    var isCat = ((classRecomendation == undefined) ? true : false); // Si no tiene categoria classRecomendation, es una categoria.

    var classRecomendationText = '';
    var hasDescription = '';
    var hasRecomendation = '';

    if (!isCat){
      classRecomendationText = ((classRecomendation) ? "bg-warning" : "");
      if(description != null){
        hasDescription =  '<div class="d-flex">'+
                            '<i><u>'+ description +'</u></i>'+
                          '</div>'+
                          '<span class="card-text" style="font-size: 0.75rem; white-space: pre-line">'+ ingredients +'</span>';
      }
      hasRecomendation =  '<div class="d-flex ml-auto">'+
                            ((classRecomendation) ? '<div class="ml-auto p-2"> <img class="fav" src="img/fav.png"> </img></div>' : '') +
                          '</div>';
    }



    var card = '<div class="card '+ classRecomendationText +'" style="display: none;"> ' +
                  '<img class="card-img-top" src="img/'+ name +'.jpg" alt="Card image" style="width:100%;">'+
                  '<div class="card-body d-flex">'+
                    '<div class="d-flex flex-column">'+
                      '<h4 class="card-title">'+ name +'</h4>'+
                      hasDescription+
                    '</div>'+
                    hasRecomendation +
                    '<a id="card-'+ id +'" href="#" class="stretched-link" '+ ((!isCat) ? 'data-toggle="modal" data-target="#exampleModal" data-nombre="'+ name +'" ' : '') + '> </a>'+
                  '</div>'+
                '</div>';
    $("#MainCardColumns").append(card);

    if (isCat){
      $('#card-'+ id).click(function(){
        updateContainer(id);
      });
    }else{
      $('#card-'+ id).click(function(){
          $("#txtbox-trago").prop('disabled', true);
          $("#txtbox-trago").val($('#card-'+ id).data('nombre'));
      });
    }
  }
}
