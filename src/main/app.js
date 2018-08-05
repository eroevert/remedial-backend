var express = require('express')
    ,cors = require('cors')
    , app = express();

//app.user(bodyParser.json());
// after the code that uses bodyParser and other cool stuff
var originsWhitelist = [
    'http://localhost:4200',      //this is my front-end url for development
    'http://www.myproductionurl.com'
];
var corsOptions = {
    origin: function(origin, callback){
        var isWhitelisted = originsWhitelist.indexOf(origin) !== -1;
        callback(null, isWhitelisted);
    },
    credentials:true
}
//here is the magic
app.use(cors(corsOptions));