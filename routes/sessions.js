var express = require('express');
var router = express.Router();
var pg = require('pg');

var conString = "postgres://dev:shadow@localhost/jamsesh";

router.get('/', function (req, res, next ){
	res.render('session');
});

router.post('/', function ( req, res, next ){
	pg.connect(conString, function ( err, client, done ){
		if ( err ){ console.log("DBERR:", err);}
		else{
			client.query("insert into sessions ( name, schedule, members, instructor, description, location, duration, recording, comments ) values ($1, $2, $3, $4, $5, $6, $7, $8, $9) returning *", 
				[req.body.name, req.body.schedule, req.body.members, req.body.instructor, req.body.description, req.body.location, req.body.duration, req.body.recording, req.body.comments],
				function ( q_err, results ){
					if ( q_err ){ console.log("QERR:", q_err);}
					else{
						res.json(results.rows);
					}
				});
		}

	});
});

router.get('/all', function ( req, res, next ){
	pg.connect(conString, function ( err, client, done ){
				if ( err ){ console.log("DBERR:", err);}
		else{
			client.query("select * from sessions", 
				[],
				function ( q_err, results ){
					if ( q_err ){ console.log("QERR:", q_err);}
					else{
						res.json(results.rows);
					}
				});
		}
	});
});

module.exports = router;