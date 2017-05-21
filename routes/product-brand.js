const { db, } = require('../pgp');

const Product = require('../models/products');
const Category = require('../models/category');
const Image = require('../models/images');
const PriceConverter = require('../models/priceConvert');

const product = new Product(db);
const cate = new Category(db);
const image = new Image(db);

let log = console.log;

module.exports = function (express) {
    const router = express.Router();

    router.get('/:name', (req, res) => {
        
        if (req.session.login === undefined) {
            req.session.login = false;
        }

        // pagination
        let q = req.query.page;
        let n = 9;
        let pgfrom = 0;
        if (q != undefined && q > 0) {
            pgfrom = (pgfrom + q - 1) * n;
        } else {
            q = 0;
        }

        let name = req.params.name;
        db.task(t => {
            if (name === 'cac-hang-khac') {
                return t.batch([
                    product.selectByOtherManufacturer('apple', 'samsung', 'oppo', n, pgfrom),
                    product.countAllByOtherManufacturer('apple', 'samsung', 'oppo'),
                    q
                ]);
            } else {
                return t.batch([
                    product.selectByManufacturer(name, n, pgfrom),
                    product.countAllByManufacturer(name),
                    q
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
                res.render('danh-sach.html', {
                    pageTitle: 'Điện thoại',
                    login: req.session.login,
                    user: req.session.user,
                    products: data[0],
                    countAll: data[1],
                    allpage: page,
                    pageCurrent: q
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