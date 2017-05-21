'use strict';

let log = console.log;

const express = require('express');
const app = express();
const bodyParser = require("body-parser");
const nunjucks = require('nunjucks');
const parseurl = require('parseurl');
const session = require('express-session');
const cookieSession = require('cookie-session');
const flash = require('express-flash');
const shortid = require('shortid');
const cookieParser = require('cookie-parser');
const { db, } = require('./pgp');
const csrf = require('csurf')

// const csrfProtection = csrf({ cookie: true })

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cookieParser('cart'));

/*
app.use(cookieSession({
    secret: 'cart',
    // Cookie Options
    maxAge: 3 * 24 * 60 * 60 * 1000 // 3 days
}));
*/

app.use(session({
    secret: 'cart',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 5*60*1000 }
}));
app.use(flash());

let dem = 0;
app.use('/', function (req, res, next) {
    dem++;
    //if(dem === 1) {
    if (!req.session.cart) {
        req.session.cart = {};
    }
    if (req.cookies['cart']) {
        let idCookieCart = req.cookies['cart'];
        //log(idCookieCart);
        let cart = req.session.cart;
        if (Object.keys(cart).length > 0) {
            //log(11);
        } else {
            db.manyOrNone('SELECT * FROM carts WHERE session_user_id = $1', idCookieCart)
                .then((data) => {
                    data.forEach((i) => {
                        cart[i.product_id] = i.qty;
                    })
                });
            //log(cart);
        }
    } else {
        res.cookie('cart', shortid.generate(), { maxAge: 3 * 24 * 60 * 60 * 1000 });
    }
    //}
    next();
});

nunjucks.configure('views', {
    autoescape: false,
    express: app,
    cache: false
});


app.engine('html', nunjucks.render);

app.set('view engine', 'html');

app.use(express.static(__dirname + '/public'));

require('./routes/routes')(app, express);

const port = 3002;
app.listen(port, () => {
    console.log('Ready for GET requests on http://localhost:' + port);
});
