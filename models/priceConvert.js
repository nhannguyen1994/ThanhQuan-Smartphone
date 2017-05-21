'use strict';

//---reformate price ----
module.exports = function(price) {
    let newPrice = price.toLocaleString('vi-VN');
    return newPrice;
}