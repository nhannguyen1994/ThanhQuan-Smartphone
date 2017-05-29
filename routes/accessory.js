const { db, } = require('../pgp');

const Accessory = require('../models/accessory');
const Category = require('../models/category');
const Image = require('../models/images');
const PriceConverter = require('../models/priceConvert');

const accessory = new Accessory(db);
const cate = new Category(db);
const image = new Image(db);

let log = console.log;

module.exports = function (express) {
    const router = express.Router();

    router.get('/', (req, res) => {
        //
        let idClient = req.cookies['cart'];
        let cart = req.session.cart;
        let total1=0;

        for (var item in cart) {

            total1 += parseInt(cart[item]);
        }
        //console.log(total1);
        req.session.total=total1;
        //
        if (req.session.login === undefined) {
            req.session.login = false;
        }

        let q = req.query.page;
        let n = 9;
        let pgfrom = 0;
        if (q != undefined && q > 0) {
            pgfrom = (pgfrom + q - 1) * n;
        } else {
            q = 1;
        }
        //
        let price = req.query.gia;
        let order = req.query.order;
        //
        db.task(t => {
            if (price !== undefined) {
                let productData = accessory.selectByPriceRange2(price, n, pgfrom);
                return t.batch([
                    productData[0],
                    productData[1],
                    q,
                    '?gia=' + price
                ]);
            } else if (order !== undefined) {
                let productData = accessory.selectByOrder(order, n, pgfrom);
                return t.batch([
                    productData[0],
                    productData[1],
                    q,
                    '?order=' + order
                ]);
            } else {
                return t.batch([
                    accessory.selectByPagination(n, pgfrom),
                    accessory.countAll(),
                    q,
                ]);
            }
        })
            .then(data => {
                let countAll = page = 0;
                data[1].forEach((index) => {
                    countAll = index.count;
                    page = Math.ceil(index.count / n, 0);
                });
                if (q > page) {
                    q = 1;
                }
                // reformat price
                data[0].forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                //
                res.render('danh-sach-pk.html', {
                    pageTitle: 'Điện thoại',
                    login: req.session.login,
                    user: req.session.user,
                    total1: req.session.total,
                    products: data[0],
                    countAll: data[1],
                    allpage: page,
                    pageCurrent: q,
                    pageQuery: data[3]
                });
            })
            .catch(error => {
                res.json({
                    success: false,
                    error: error.message || error
                });
            });
    });

    router.get('/:id', function (req, res) {
        //
        let idClient = req.cookies['cart'];
        let cart = req.session.cart;
        let total1=0;

        for (var item in cart) {

            total1 += parseInt(cart[item]);
        }
        //console.log(total1);
        req.session.total=total1;
        //

        if (req.session.login === undefined) {
            req.session.login = false;
        }
        let id = req.params.id;
        db.task(t => {
            return t.batch([
                accessory.detail(id),
                image.selectByParentId(id),
                accessory.selectNew(10)
            ]);
        })
            .then(data => {
                // reformat price
                data[0].price = PriceConverter(data[0].price);
                data[2].forEach(eachProduct => {
                    eachProduct.price = PriceConverter(eachProduct.price);
                });
                //
                res.render('chi-tiet-pk.html', {
                    pageTitle: 'Điện Thoại',
                    login: req.session.login,
                    user: req.session.user,
                    total1: req.session.total,
                    detail: data[0],
                    images: data[1],
                    productSimilar: data[2]
                });
            })
            .catch(error => {
                res.json({
                    success: false,
                    error: error.message || error
                });
            });
    });

    return router
};