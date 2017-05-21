'use strict';

const Model = require('./model');

class Category extends Model{
    constructor (db){
        super(db);
        this.db = db;
    }
    selectCurrentById (id) {
        return this.db.many("SELECT * FROM product_type WHERE parent = $1", id);
    }


}

module.exports = Category;