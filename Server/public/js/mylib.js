// This file is a reference of how it should be used JQuery.


// Its important to ask if the document has finished loading the files.
$(document).ready(function(){
  // Acá hay que poner la barra de carga
  let sql = {msg : "SELECT * FROM cat"};
  addElement(sql);


  $('#btn-ordenar').click(function(){
    var json = {trago: $('#txtbox-trago').val() , nombre: $('#txtbox-nombre').val() };
    $.post("/ordenar", json, function (res){
      alert(res.msg);
    });

    $('#exampleModal').modal('toggle');
  })
});

$('#exampleModal').on('show.bs.modal', function (event) {
  var data = button.data('nombre');
  var modal = $(this);
  modal.find('.modal-body input').val(recipient);
});


function queryDB(sql, callback) {
  $.post("/query", sql, callback);
}

function addElement(sql){
  queryDB(sql, function (res) {
    for (var i = 0; i < res.data.length; i++){
      appendCard(res.data[i].id , res.data[i].nombre, res.data[i].texto, res.data[i].recomendado);
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

function appendCard(id, name, description, classRecomendation) {
  var isCat = ((classRecomendation == undefined) ? true : false); // Si no tiene categoria classRecomendation, es una categoria.

  var classRecomendationText = '';
  var hasDescription = '';
  var hasRecomendation = '';

  if (!isCat){
    classRecomendationText = ((classRecomendation) ? "bg-warning" : "");
    hasDescription =  '<div class="d-flex">'+
                        '<p class="card-text">'+ description +'</p>'+
                      '</div>';
    hasRecomendation =  '<div class="d-flex ml-auto">'+
                          ((classRecomendation) ? '<div class="ml-auto p-2"> <img class="fav" src="img/fav.png"> </img></div>' : '') +
                        '</div>';
  }



  var card = '<div class="card '+ classRecomendationText +'" style="display: none;"> ' +
                '<img class="card-img-top" src="img/'+ name +'.jpg" alt="Card image" style="width:100%;">'+
                '<div class="card-body d-flex">'+
                  '<div class="d-flex flex-column">'+
                    '<h4 class="card-title">'+ name +'</h4>'+
                    hasDescription +
                  '</div>'+
                  hasRecomendation +
                  '<a id="card-'+ id +'" href="#" class="stretched-link" '+ ((!isCat) ? 'data-toggle="modal" data-target="#exampleModal" data-nombre="'+ name +'" ' : '') + '> </a>'+
                '</div>'+
              '</div>';
  $("#MainCardColumns").append(card);

  if (isCat){
    $('#card-'+ id).click(function(){
      updateContainer(id);
    })
  }

}



  // '<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black;">'
  //   '<div class="modal-dialog" role="document">'
  //     '<div class="modal-content">'
  //       '<div class="modal-header">'
  //         '<h5 class="modal-title" id="exampleModalLabel">Realizar Pedido</h5>'
  //         '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
  //           '<span aria-hidden="true">&times;</span>'
  //         '</button>'
  //       '</div>'
  //       '<div class="modal-body">'
  //         '<form>'
  //           '<div class="form-group">'
  //             '<label for="recipient-name" class="col-form-label">Trago:</label>'
  //             '<input type="text" class="form-control" id="txtbox-trago">'
  //           '</div>'
  //           '<div class="form-group">'
  //             '<label for="message-text" class="col-form-label">Complete su nombre:</label>'
  //             '<textarea class="form-control" id="txtbox-nombre"></textarea>'
  //           '</div>'
  //         '</form>'
  //       '</div>'
  //       '<div class="modal-footer">'
  //         '<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>'
  //         '<button id="btn-ordenar" type="button" class="btn btn-primary">Ordenar</button>'
  //       '</div>'
  //     '</div>'
  //   '</div>'
  // '</div>'
  //
