// Global variable :D
var selectedItem = null;

$(document).ready(function(){
  refresh();

  $('#btn-ready').click(function(){
    var json = {idPedido: selectedItem };
    $.post("/pedido", json, function (res){
      alert(res.msg);
    });
    refresh();
    selectedItem = null;
  })

  $('#Pedir').click(function(){
    $("#txtbox-trago").prop('disabled', false);
    $("#exampleModal").modal('toggle');
  });

  $('#btn-refresh').click(refresh);
});

function refresh(){
  let sql = {msg : "SELECT * FROM pedido WHERE terminado = false;"};
  $("#list-tab").empty();
  addListElement(sql);
  setTimeout(function (){
    if( $("#list-tab").html().length == 0 ){
      $("#list-tab").append("<h1> All Done! \u{1F44D} </h1>");
    }
  }, 500);

}

function addListElement(sql){
  queryDB(sql, function (res) {
    for (var i = 0; i < res.data.length; i++){
      appendListElement(res.data[i].idPedido , res.data[i].nombreTrago, res.data[i].nombrePersona);
    }

  });
  setTimeout(function (){
    $("#listbox").animate({
      opacity: '1'
    });
  }, 500);
}

function appendListElement(id, trago, name) {
  if (id != null){
    var element = '<a class="list-group-item list-group-item-action" id="list-home-list-'+id+'"  data-toggle="list" href="#" role="tab" aria-controls="home">' + name + ' pidió ' + trago + '</a>';

    $("#list-tab").append(element);
    $('#list-home-list-'+ id).click(function(){
        selectedItem = id;
    });
  }


}
