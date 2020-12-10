const express = require('express');
const mysql = require('mysql');

// Create express application
const app = express();
app.use(express.json());
app.use(express.static('./public'))

app.listen('3000', () =>{
  console.log('Server listening on port 3000');
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

// Basic response
app.get('/query', (req, res) => {
  db.query("SELECT * FROM trago", function (err, result, fields) {
    if (err) throw err;
    console.log(result);

    res.json({
      msg : 'Hello World! \u{2764}',
      tragoCero : result[0].nombre
    });
  });

});


// // Create DB
// app.get('/createdb', (req, res) => {
//   let sql = 'CREATE DATABASE tragosdb';
//   db.query(sql, (err, result) => {
//     if(err) throw err;
//     res.send('Database created!');
//     console.log(result);
//   });
// });
//
// // Delete DB
// app.get('/deletedb', (req, res) => {
//   let sql = 'DROP DATABASE tragosdb';
//   db.query(sql, (err, result) => {
//     if(err) throw err;
//     res.send('Database deleted!');
//     console.log(result);
//   });
// });
