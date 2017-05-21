const { db, } = require('../pgp');
const shortid = require('shortid');

const Product = require('../models/products');
const PriceConverter = require('../models/priceConvert');

const product = new Product(db);

let log = console.log;

function getFormattedDate() {
    var date = new Date();
    var str = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

    return str;
}

module.exports = function (express) {
    const router = express.Router();

    router.post('/', (req, res) => {

        //log(req.body);
        let idClient = req.cookies['cart'];
        let cart = req.session.cart;
        let ids = '';
        let count = 0;

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
            window.location.replace("/gio-hang/");
            exit;
        }

        db.task(t => {
            return t.batch([
                product.cartIDs(ids),
                cart
            ]);
        })
            .then(data => {
                let total = 0;
                let allProducts = data[0]; // detail of all products in the shopping cart
                let orderData; // variable to store order info
                let cart = data[1]; // stores quantity of each product in the cart

                allProducts.forEach((item) => { // calculate total price of the order
                    total = total + (item.price * cart[item.product_id]);
                });

                if (req.body['thanhtoan']) {
                    if (req.body['name'] && req.body['phone'] && req.body['email'] && req.body['address'] && req.body['method']) {
                        let order_id = shortid.generate();

                        let user_id = null;
                        if (req.session.user) {
                            user_id = req.session.user.user_id;
                        }

                        orderData = {
                            id: order_id,
                            user_id: user_id,
                            name: req.body['name'],
                            phone: req.body['phone'],
                            email: req.body['email'],
                            address: req.body['address'],
                            payment_id: req.body['payment_id'],
                            note: req.body['note'],
                            status: 'pending',
                            order_date: getFormattedDate(),
                            //delivery_date: 'NULLIF("0000-00-00 00:00:00", "0000-00-00 00:00:00")::timestamp',
                            delivery_date: '0000-00-00 00:00:00',
                            total: total
                        };

                        // create an array of all products to be inserted into detailed_orders table
                        let allProductsArr = [];
                        // Insert order info into orders table
                        db.query("INSERT INTO orders (orders_id, user_id, name, phone, email, address, note, status, total, payment_id, order_date, delivery_date)" +
                            "VALUES(${id}, ${user_id}, ${name}, ${phone}, ${email}, ${address}, ${note}, ${status}, ${total}, ${payment_id}, ${order_date}, ${delivery_date}) RETURNING orders_id", orderData)
                            .then((returned_orders_id) => {
                                // returned_orders_id is actually an array of object [ anonymous { orders_id: 'Syl60xDeb' } ]
                                // insert into detailed_orders
                                allProducts.forEach(item => {
                                    let id = shortid.generate();
                                    let eachProduct = {
                                        detailed_orders_id: id,
                                        orders_id: returned_orders_id[0].orders_id,
                                        product_id: item.product_id,
                                        product_type_id: item.product_type_id,
                                        product_name: item.product_name,
                                        quantity: cart[item.product_id],
                                        price: item.price
                                    }
                                    allProductsArr.push(eachProduct);
                                    // insert each product into detailed_orders
                                    db.query("INSERT INTO detailed_orders (detailed_orders_id, orders_id, product_id, product_type_id, product_name, quantity, price) VALUES(${detailed_orders_id}, ${orders_id}, ${product_id}, ${product_type_id}, ${product_name}, ${quantity}, ${price})", eachProduct);
                                });
                            })
                            .then(data => {
                                //console.log(orderData);
                                //console.log(allProducts);
                                //console.log(total);
                                // Remove Session Cookies 
                                req.cookies['cart'] // = session_user_id in cart table
                                db.query("DELETE from carts WHERE session_user_id = $1", req.cookies['cart']);
                                req.session.cart = {};

                                // Reformat Price to display in rendered page
                                allProducts.forEach(eachProduct => {
                                    eachProduct.total = cart[eachProduct.product_id] * eachProduct.price;
                                    eachProduct.total = PriceConverter(eachProduct.total);
                                    eachProduct.price = PriceConverter(eachProduct.price);
                                });
                                total = PriceConverter(total);

                                res.render('thanh-cong.html', {
                                    title: 'Đặt hàng thành công',
                                    login: req.session.login,
                                    user: req.session.user,
                                    orderData: orderData,
                                    products: allProducts,
                                    cart: cart,
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
                } else {
                    window.location.replace("/gio-hang/");
                }
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
