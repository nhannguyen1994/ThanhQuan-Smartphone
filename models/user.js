'use strict';
const bcrypt = require('bcryptjs');

class User {
    constructor(db) {
        this.db = db;
    }

    selectUser(email) {
        return this.db.oneOrNone("SELECT * FROM user_account WHERE email= $1", [email]);
    }
    selectUserById(user_id) {
        return this.db.oneOrNone("SELECT * FROM user_account WHERE user_id = $1", [user_id]);
    }
    addUser(email, hashPass, fullname, phone, gender, address, agreement) {
        return this.db.one("INSERT INTO user_account(email, pass, fullname, phone, gender, address, agreement) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING user_id, email, fullname, phone, gender, address", [ email, hashPass, fullname, phone, gender, address, agreement]);
    }
    updateUser(user_id, newValue1, newValue2, newValue3) {
        return this.db.one("UPDATE user_account SET fullname = $2, phone = $3, address = $4 WHERE user_id = $1 RETURNING user_id, email, fullname, phone, gender, address", [user_id, newValue1, newValue2, newValue3]);
    }
    updatePassword(user_id, newPass) {
        return this.db.none("UPDATE user_account SET pass = $2 WHERE user_id = $1", [user_id, newPass]);
    }
    generateHash(password) {
        return bcrypt.hashSync(password, bcrypt.genSaltSync(5), null);
    }
    validPassword(password, pass) {
        return bcrypt.compareSync(password, pass);
    }
}

module.exports = User;