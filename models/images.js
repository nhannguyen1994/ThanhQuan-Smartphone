'use strict';

const Model = require('./model');

class Image extends Model{
    constructor (db){
        super(db);
        this.db = db;
    }
    all () {
        return this.db.many("SELECT * FROM images");
    }
    selectByParentId (id) {
        return this.db.many("SELECT * FROM images WHERE product_id = $1", id);
    }

}

module.exports = Image;