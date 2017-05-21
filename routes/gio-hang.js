const { db, } = require('../pgp');
const shortid = require('shortid');

const Product = require('../models/products');
const PriceConverter = require('../models/priceConvert');

const product = new Product(db);

let log = console.log;

module.exports = function (express) {
    const router = express.Router();
    
    // add to shopping cart get request 
    router.get('/add-to-cart/:id', (req, res) => {

        let idClient = req.cookies['cart'];
        //Add to cart
        let addtocart = req.params.id;

        let cart = req.session.cart;
        //log(cart);
        let addcart = '';
        if (typeof addtocart != 'undefined') {

            if (cart && cart[addtocart]) {
                let qty = parseInt(cart[addtocart]);
                cart[addtocart] = qty + 1;

                let cart_insert = {
                    session_user_id: idClient,
                    product_id: addtocart,
                    qty: qty + 1
                };

                db.none('UPDATE carts SET qty=${qty} WHERE session_user_id=${session_user_id} AND product_id=${product_id}', cart_insert)
                    .then(() => {
                        console.log('Update Success');
                        res.redirect(req.header('referrer'));
                    })
                    .catch(error => {
                        res.json({
                            success: false,
                            error: error.message || error
                        });
                    });
            } else {
                cart[addtocart] = 1;

                let cart_insert = {
                    id: '',
                    session_user_id: idClient,
                    product_id: addtocart,
                    qty: 1
                };
                db.none('INSERT INTO carts(session_user_id, product_id, qty) VALUES(${session_user_id}, ${product_id}, ${qty})', cart_insert)
                    .then(() => {
                        console.log('Insert Success');
                        //console.log(req.header('referrer'));
                        res.redirect(req.header('referrer'));
                    })
                    .catch(error => {
                        res.json({
                            success: false,
                            error: error.message || error
                        });
                    });

            }
        }
    });

    // access gio-hang.html page
    router.get('/', (req, res) => {

        if (req.session.login === undefined) {
            req.session.login = false;
        }

        //Lấy giá trị session cart
        let cart = req.session.cart;
        //log(cart);
        let ids = '';
        let count = 0;

        //Lấy chuỗi product_id để SELECT DATABASE
        for (item in cart) {
            count++;
            if (count === 1) {
                ids += "'" + item + "'";
            } else {
                ids += ",'" + item + "'";
            }
        }

        //Đếm cart
        let countCart = 0;
        if (cart) {
            countCart = Object.keys(cart).length;
        }
        if (!cart || countCart === 0) {
            res.render('gio-hang.html', {
                title: 'Giỏ hàng',
                login: req.session.login,
                user: req.session.user,
                product: '',
                cart: '',
            });
        } else {

            db.task(t => {
                return t.batch([
                    product.cartIDs(ids),
                    cart
                ]);
            })
                .then(data => {
                    //log(data);
                    // reformat price
                    // calculate total price of the order
                    let total = 0;
                    data[0].forEach(eachProduct => {
                        eachProduct.total = data[1][eachProduct.product_id] * eachProduct.price;
                        total += eachProduct.total;
                        eachProduct.total = PriceConverter(eachProduct.total);
                        eachProduct.price = PriceConverter(eachProduct.price);
                    });
                    total = PriceConverter(total);
                    //
                    res.render('gio-hang.html', {
                        title: 'Giỏ hàng',
                        login: req.session.login,
                        user: req.session.user,
                        product: data[0],
                        cart: data[1],
                        total: total
                    });
                })
                .catch(error => {
                    res.json({
                        success: false,
                        error: error.message || error
                    });
                });
        }
    });

    router.post('/', (req, res) => {

        //log(req.body);
        let idClient = req.cookies['cart'];
        let cart = req.session.cart;
        let ids = '';
        let count = 0;
        if (req.body['capnhat']) {
            for (item in cart) {
                if (req.body[item] > 0) {

                    cart[item] = req.body[item];

                    let qty = req.body[item];

                    let cart_insert = {
                        session_user_id: idClient,
                        product_id: item,
                        qty: qty
                    };

                    db.none('UPDATE carts SET qty=${qty} WHERE session_user_id=${session_user_id} AND product_id=${product_id}', cart_insert)
                        .then(() => {
                            console.log('Cart: Update Success');
                        })
                        .catch(error => {
                            res.json({
                                success: false,
                                error: error.message || error
                            });
                        });
                } else {
                    delete cart[item];
                    let cart_insert = {
                        session_user_id: idClient,
                        product_id: item
                    };
                    db.none('DELETE FROM carts WHERE session_user_id=${session_user_id} AND product_id=${product_id}', cart_insert)
                        .then(() => {
                            console.log('Cart: Delete Success');
                        })
                        .catch(error => {
                            res.json({
                                success: false,
                                error: error.message || error
                            });
                        });
                }
            }
        }

        for (item in cart) {
            count++;
            if (count === 1) {
                ids += "'" + item + "'";
            } else {
                ids += ",'" + item + "'";
            }
        }

        //log(ids);
        let countCart = Object.keys(cart).length;
        if (countCart === 0) {
            res.render('gio-hang.html', {
                title: 'Giỏ hàng',
                login: req.session.login,
                user: req.session.user,
                product: '',
                cart: '',
            });
        }

        db.task(t => {
            return t.batch([
                product.cartIDs(ids),
                cart
            ]);
        })
            .then(data => {
                // reformat price
                // calculate total price of the order
                let total = 0;
                data[0].forEach(eachProduct => {
                    eachProduct.total = data[1][eachProduct.product_id] * eachProduct.price;
                    total += eachProduct.total;
                    eachProduct.total = PriceConverter(eachProduct.total);
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                total = PriceConverter(total);
                //
                res.render('gio-hang.html', {
                    title: 'Giỏ hàng',
                    login: req.session.login,
                    user: req.session.user,
                    product: data[0],
                    cart: data[1],
                    total: total
                });
            })
            .catch(error => {
                res.json({
                    success: false,
                    error: error.message || error
                });
            });
    });

    return router;
};