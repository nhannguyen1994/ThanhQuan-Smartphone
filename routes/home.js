const { db, } = require('../pgp');

const Product = require('../models/products');
const Accessory = require('../models/accessory');
const Category = require('../models/category');
const Image = require('../models/images');
const PriceConverter = require('../models/priceConvert');

const product = new Product(db);
const accessory = new Accessory(db);
const cate = new Category(db);
const image = new Image(db);

let log = console.log;

module.exports = function (express, cart) {

    const router = express.Router();


    router.get('/', (req, res, next) => {

        //===tinh tong cac so luong sp co trong gio hang
        let idClient = req.cookies['cart'];
        let cart = req.session.cart;
        let total1=0;

        for (var item in cart) {

            total1 += parseInt(cart[item]);
        }
        //console.log(total1);
        req.session.total=total1;

        // check if user is logged in -> if not assign req.session.login = false
        if (req.session.login === undefined) {
            req.session.login = false;
        }
        //console.log(req.session);
        // query database to get product data
        db.task(t => {
            return t.batch([
                //cate.selectCurrentById('ptpk'),
                product.selectHot(10),
                product.selectNew(10),
                accessory.selectHot(10)
            ]);
        })
            .then(data => {
                // reformat price
                data[0].forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                data[1].forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                data[2].forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                //
                res.render('index.html', {
                    pageTitle: 'Trang chủ',
                    login: req.session.login,
                    user: req.session.user,
                    total1: req.session.total,
                    productHot: data[0],
                    productNew: data[1],
                    accessoryHot: data[2]
                });
            })
            .catch(error => {
                return error.detail;
            });
    });


    router.post('/search', (req, res) => {
        product.findByName(req.body.search)
            .then(data => {
                // reformat price
                data.forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                //
                res.render('danh-sach.html', {
                    pageTitle: 'Tìm Kiếm',
                    user: req.session.user,
                    total1: req.session.total,
                    products: data
                });
            })
    });

    return router
};