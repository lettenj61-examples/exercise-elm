'use strict';

var path = require('path');
var { Elm } = require('./dist/Example');

var app = Elm.Example.init();

console.log(app);
console.log('\n\n');

app.ports.putStrLn.subscribe(msg => console.log(msg));

app.ports.parse.subscribe(query => {
  console.log('got ' + query);
  var parsed = path.parse(query);
  app.ports.pathInfo.send(parsed);
});

// console.log(app);
