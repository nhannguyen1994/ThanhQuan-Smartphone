module.exports = (app, express) => {
    
    const home = require('./home')(express);
    app.use('/', home);

    const user = require('./user')(express);
    app.use('/auth', user);

    const product = require('./product')(express);
    app.use('/dien-thoai', product);

    const accessory = require('./accessory')(express);
    app.use('/phu-kien', accessory);

    const productBrand = require('./product-brand')(express);
    app.use('/hang-dien-thoai', productBrand);

    const giohang = require('./gio-hang')(express);
    app.use('/gio-hang', giohang);

    const thanhcong = require('./thanh-cong')(express);
    app.use('/thanh-cong', thanhcong);

    //const donhang = require('./don-hang')(express);
    //app.use('/don-hang', donhang);

    app.get('/tin-tuc', (req, res) => {
        if (req.session.login === undefined) {
            req.session.login = false;
        }
        res.render('tin-tuc.html', { pageTitle: 'Tin Tức', login: req.session.login, user: req.session.user });
    });

    app.get('/lien-he', (req, res) => {
        if (req.session.login === undefined) {
            req.session.login = false;
        }
        res.render('lien-he.html', { pageTitle: 'Liên Hệ', login: req.session.login, user: req.session.user  });
    });

    app.get('/bai-viet', (req, res) => {
        if (req.session.login === undefined) {
            req.session.login = false;
        }
        res.render('bai-viet.html', { pageTitle: 'Bài Viết', login: req.session.login, user: req.session.user  });
    });

    // app.get('/tai-khoan', (req, res) => {
    //     res.render('tai-khoan.html', { pageTitle: 'Tài Khoản' });
    // });
};
