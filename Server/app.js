const express = require('express');
const mysql = require('mysql');

// Create express application
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded
app.use(express.static('./public'));


let port = 3000;
app.listen(port, '0.0.0.0', () =>{  // Permitis que cualquiera se conecte con 0.0.0.0
  console.log('Server listening on port ' + port.toString());
})

// Create connection ( port 3306 )
const db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'admin',
  database : 'tragosdb'
});

// Connect db
db.connect( (err) => {
  if(err){
    console.log('Error while trying to connect. Database already exists.');
  }
  console.log('MySql connected \u{1F601}');
});


// Elaborated response to query with post method
app.post('/query', function (req, res) {
  db.query(req.body.msg, function (err, result, fields) {
    if (err) {
      res.send(err.sqlMessage);
    } else {
      res.json({
        data : result
      });

    }
  });
});


app.post('/ordenar', function (req, res) {
  var nombre = req.body.nombre;
  var trago =  req.body.trago;
  if(!nombre || !trago){
    res.json({
      msg : 'Su pedido falló! \u{2620}'
    });
  }else{
    let sql = 'INSERT INTO pedido VALUES (0, "'+ trago +'", "'+nombre+'", false)';
    db.query(sql, function (err, result, fields) {
      if (!err) {
        res.json({
          msg : 'Su pedido se realizó correctamente! \u{2764}'
        });
      }else{
        res.json({
          msg : 'Su pedido falló! \u{2620}'
        });
      }
    });
  }
});

app.post('/pedido', function (req, res) {
  var id = req.body.idPedido;
  if(!id){
    res.json({
      msg : 'Debe seleccionar al menos un elemento \u{1F47F}'
    });
  }else{
    let sql = 'UPDATE pedido SET terminado=true WHERE idPedido='+id+';'
    db.query(sql, function (err, result, fields) {
      if (!err) {
        res.json({
          msg : 'Se ha actualizado correctamente! \u{1F95D}'
        });
      }else{
        res.json({
          msg : 'Su pedido falló! \u{2620}'
        });
      }
    });
  }
});
