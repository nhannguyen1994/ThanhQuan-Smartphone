const { db, } = require('../pgp');

const User = require('../models/user');
const user = new User(db);
// use Bcrypt for hasing passwords
//const bcrypt = require('bcryptjs');
//const flash = require('express-flash');
module.exports = function (express) {
    const router = express.Router();

    // handle sign up request
    router.post('/sign-up', (req, res) => {
        if (req.body.password !== req.body.password2) {
            req.flash('error', 'Passwords do not match');
            res.status(401).render('index', { login: req.session.login });
        } else {
            user.selectUser(req.body.email)
                .then(data => {
                    if (data === null) {
                        // this username does not yet exist
                        // hasing password by auto-generating a salt and hash
                        let hashPass = user.generateHash(req.body.password);
                        user.addUser(req.body.email, hashPass, req.body.fullname, req.body.phone, req.body.gender, req.body.address, req.body.agreement)
                            .then((data) => {
                                console.log('Insert account successfully');
                                req.session.login = true;
                                req.session.user = data;
                                //console.log(req.session);
                                req.flash('success', 'You sign up successfully!');
                                res.render('tai-khoan', { login: req.session.login, user: req.session.user });
                            })
                            .catch(error => {
                                console.log(error.message);
                            });
                    } else {
                        // this username already exists
                        req.flash('error', 'Account already exists. Please log in or register another account!');
                        res.status(401).render('index', { login: req.session.login });
                    }
                })
                .catch(error => {
                    console.log(error.message);
                });
        }

    });

    // handle sign in request
    router.post('/log-in', (req, res) => {
        //console.log(req.body);
        user.selectUser(req.body.email)
            .then(data => {
                if (data === null) {
                    // this account does not match
                    console.log('Log in unsuccessfully. Account does not exist!!!');
                    req.flash('error', 'Log in unsuccessfully. Account does not exist!');
                    res.status(401).render('index', { login: req.session.login });
                } else {
                    // this account matches 
                    if (user.validPassword(req.body.password, data.pass)) {
                        console.log('Log in successfully');
                        req.session.login = true;
                        req.session.user = {
                            user_id: data.user_id,
                            email: data.email,
                            fullname: data.fullname,
                            phone: data.phone,
                            gender: data.gender,
                            address: data.address
                        };
                        //console.log(req.session);
                        req.flash('success', 'You log in successfully!');
                        res.render('tai-khoan', { login: req.session.login, user: req.session.user });
                    } else {
                        console.log('Log in unsuccessfully. Account does not match!!!');
                        req.flash('error', 'Log in unsuccessfully. Account does not match!');
                        res.status(401).render('index', { login: req.session.login });
                    }
                }
            })
            .catch(error => {
                console.log(error.message);
            });
    });

    // Show user account info
    router.get('/tai-khoan', (req, res) => {
        if (req.session.login) {
            console.log('user logged in');
            //req.flash('success', 'You log in successfully!');
            res.render('tai-khoan', { login: req.session.login, user: req.session.user });
        } else {
            console.log('user not logged in ');
            req.flash('error', 'User is not logged in. Please log in');
            res.status(401).render('index', { login: req.session.login });
        }
    });

    // Show user order info
    // Nhan Thêm Routes Cho Đơn Hàng Vào Đây  ==========================
    router.get('/don-hang', (req, res) => {
        if (req.session.login) {
            db.any("SELECT orders_id, user_id, name, phone, email, note, status, total, payment_id, order_date, delivery_date FROM orders")
                .then((data) => {
                     //console.log(data);
                     db.any("SELECT orders_id, product_id, product_type_id, product_name, price, quantity FROM detailed_orders")
                         .then(data2 => {
                             //console.log(data2);
                            res.render('don-hang', {
                                login: req.session.login,
                                user: req.session.user,
                                data: data,
                                data2: data2
                            });
                         })
                })
        }
        else
            {
                req.flash('error');
                res.status(401).render('gio-hang', {login: req.session.login, user: req.session.user});
            }
    });


    // logout 
    router.get('/logout', (req, res) => {
        req.session.login = false;
        delete req.session.user;
        console.log('Log out');
        //console.log(req.session);
        req.flash('error', 'User is logged out');
        res.status(401).render('index', { login: req.session.login });
    });

    // UPDATE USER INFO IN TAI-KHOAN.HTML
    router.post('/edit-user', (req, res) => {
        //console.log(req.session.user.user_id);
        if (req.session.login) {
            user.updateUser(req.session.user.user_id, req.body.newName, req.body.newPhone, req.body.newAddress)
                .then(data => {
                    console.log('user edit info');
                    // update session user with new data
                    req.session.user = data;
                    res.render('tai-khoan', { login: req.session.login, user: req.session.user });
                })
                .catch(error => {
                    console.log(error.message);
                });
        } else {
            console.log('user not logged in ');
            req.flash('error', 'User is not logged in. Please log in');
            res.status(401).render('index', { login: req.session.login });
        }
    });
    router.post('/edit-user-pass', (req, res) => {
        // check if the user is logged in and their new passwords match
        if ((req.body.newPass === req.body.newPass2) && req.session.login) {
            user.selectUser(req.session.user.email)
                .then(data => {
                    // check if the oldPass match user pass in database
                    if (user.validPassword(req.body.oldPass, data.pass)) {
                        // hash newPass and update the database
                        let hashNewPass = user.generateHash(req.body.newPass);
                        user.updatePassword(req.session.user.user_id, hashNewPass)
                            .then(data => {
                                console.log('user edit pass');
                                res.render('tai-khoan', { login: req.session.login, user: req.session.user });
                            })
                    }
                })
                .catch(error => {
                    console.log(error.message);
                });
        } else {
            console.log('user changes password unsuccessfully');
            req.flash('error', 'User is not validated. Passwords do not match');
            res.status(401).render('tai-khoan', { login: req.session.login, user: req.session.user });
        }
    });

    return router;
}