const express = require('express');
const MongoClient = require('mongodb').MongoClient
const bodyParser= require('body-parser')
var ObjectID = require('mongodb').ObjectID;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//navigate between ports node js and angular 
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  next();
}); 

MongoClient.connect('mongodb://localhost:27017/JsonData', (err, db) => {
  if (err) return console.log(err)

  app.listen(3000, () => {
    console.log('app working on 3000')
  });

  let dbase = db.db("JsonData");

 app.get('/check', (req, res, next) => {
    dbase.collection('currency').find().toArray( (err, results) => {
      res.send(results)
    });
  });

 
});
