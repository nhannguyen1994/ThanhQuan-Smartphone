/**
 * Created by Linh Ngo in 14/04/2017
 */
//=========USING NIGHTMARE JS TO CRAWL MOBILE PHONE PRODUCT PAGE===============

const shortid = require('shortid');
const Nightmare = require('nightmare');
const async = require('async');
let nightmare = Nightmare({ show: true });
const download = require('image-downloader');
const shell = require('shelljs');
const fs = require('fs');

//----- connect to db with pg-promise--------
const { db, config } = require('./pgp.js');
const pgp = require('pg-promise');

//-------------------------------------------
let productData = [];
let imageData = [];

/**
 * Main crawl function runs through an array of url links and crawl data in each link
 * @param {*} array of url 
 * @param {*} cb 
 */
function crawl(arr, cb) {
    function test(item, cb) {
        // item is each url 
        let night = new Nightmare();
        night.goto(item)
            .wait(5000)
            .evaluate(function () {
                try {
                    let obj = {};
                    let name = document.querySelector('h1[itemprop=name] strong').innerText.split('-')[0].trim();
                    let manufacturer = document.querySelector('.simple-prop p span a').innerText.split('-')[0].split(' ')[0].trim();
                    let price = parseInt(document.querySelector("[itemprop='price']").innerText.split('₫')[0].split(".").join("").trim());
                    let mainPropertyAll = document.querySelectorAll('.simple-prop p');
                    let detailPropertyMain = document.querySelectorAll('.product-prop-details .group');
                    let detailPropertyAll = document.querySelectorAll('.product-prop-details [itemprop=feature]');
                    // fixed description
                    let desObj = {
                        "Bảo hành chính hãng": "Thân máy 12 tháng. Sạc 12 tháng. Tai nghe 12 tháng",
                        "Giao hàng": "Giao hàng miễn phí trong 2 tiếng (nếu đặt hàng sau 19h cửa hàng sẽ giao hàng vào hôm sau)",
                        "Trong hộp có": "Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp",
                        "Đổi hàng": "1 đổi 1 trong 1 tháng với sản phẩm lỗi"
                    };

                    //obj['url'] = url;
                    obj['product_name'] = name;
                    obj['description'] = desObj;
                    obj['manufacturer_id'] = manufacturer;
                    obj['price'] = price;
                    obj['product_template_id'] = 'M01';
                    obj['category_id'] = 'ptdt';
                    // just for now, we generate some random data 
                    let day = Math.floor(Math.random() * (31 - 15)) + 15;
                    let month = Math.floor(Math.random() * (5 - 1)) + 1;
                    obj['store_day'] = `2017-0${month}-${day} 09:00:00`;
                    obj['quantity'] = Math.floor(Math.random() * 50 + 1);
                    obj['sales_volume'] = Math.floor(Math.random() * 100 + 1);

                    // main property
                    let mainProp = {}
                    mainPropertyAll.forEach(p => {
                        let prop = p.querySelector('label').innerText.replace(":", "");
                        let value = p.querySelector('span').innerText.trim();
                        mainProp[prop] = value
                    })
                    obj['main_property'] = mainProp;

                    // detail property
                    let detailProp = {};
                    detailPropertyMain.forEach(td => {
                        let propCat = td.innerText.trim();
                        detailProp[propCat] = {};
                    })
                    let propCat = "";
                    detailPropertyAll.forEach(tr => {
                        if (tr.querySelector('.group') !== null) {
                            propCat = tr.querySelector('.group').innerText.trim();
                            let prop = tr.querySelector('.text').innerText.trim();
                            let value = tr.querySelector('.data').innerText.trim();
                            detailProp[propCat][prop] = value;
                        } else {
                            let prop = tr.querySelector('.text').innerText.trim();
                            let value = tr.querySelector('.data').innerText.trim();
                            detailProp[propCat][prop] = value;
                        }
                    })
                    obj['detail_property'] = detailProp;
                    obj['promotion'] = '';

                    // images
                    let imgArr = [];
                    let images = document.querySelectorAll('img[u="image"]');
                    images.forEach(img => {
                        let src = img.getAttribute('src');
                        imgArr.push(src);
                    });
                    obj['image'] = imgArr;
                    return obj;
                } catch (err) {
                    console.log(err.message);
                    return {};
                }
            })
            .end()
            .then(function (res) {
                if (!res) {
                    cb(null, {});
                }
                try {
                    let id = shortid.generate();
                    res['product_id'] = id;
                    
                    // Create dir for the product images before downloading
                    let destPath = __dirname + '/images/product';
                    shell.mkdir('-p', destPath);   
                    /**
                     * Download image function uses module 'image-downloader'
                     * @param {*} src: image url
                     * @param {*} cb 
                     */
                    let downloadImg = (src, cb) => {

                        let index = res['image'].indexOf(src);
                        //console.log(res['image']);
                        //console.log(res['image'].indexOf(src));
                        let options = {
                            url: src,
                            dest: destPath + '/' + id + '_' + index + '.jpg'
                        }
                        download.image(options)
                            .then(({ filename, image }) => {
                                //console.log(filename);
                                let imgName = filename.substring(filename.lastIndexOf("/") + 1, filename.length);
                                console.log(imgName);
                                // after downloading image, use cb(null, imgName) to return imgName to the array of final results
                                // the array is imgArr in the async function below
                                cb(null, imgName);
                                //console.log('File saved to', filename)
                            }).catch((err) => {
                                throw err
                            });
                    };

                    // Use async.map to ensure that all images are downloaded before exporting to exportToDB
                    /**
                     * @param: res['image']: an array of images url
                     * @param: downloadImg: a download image function -> apply this function to each image url
                     * 
                     */
                    //console.log(res['image']);
                    async.map(res['image'], downloadImg, (err, imgArr) => {
                        //console.log(imgArr);
                        // here imgArr is final result, an array contains all image names of the product 
                        exportToDB(imgArr);
                    })

                    let exportToDB = (imgArr) => {
                        //export product data to DB every crawl time
                        //delete some unnecessary properties
                        delete res['image'];
                        delete res['detail_property']['Bộ sản phẩm'];
                        delete res['detail_property']['Thông tin cơ bản'];

                        //-----------Export to database directly---------
                        //console.log(res);
                        //export product data to product table
                        db.none('INSERT INTO product VALUES(${product_id}, ${product_name}, ${product_template_id}, ${product_type_id}, ${manufacturer_id}, ${sales_volume}, ${store_day}, ${price}, ${quantity}, ${description}, ${main_property}, ${detail_property}, ${promotion})', res)
                            .then(() => {
                                console.log("insert product success");
                            })
                            .then(() => {
                                //console.log(imgArr);
                                //loop through the array of images to insert to product image table
                                imgArr.forEach(imgName => {
                                    let id_image = shortid.generate();
                                    db.none('INSERT INTO images VALUES(${image_id}, ${url_image}, ${product_id})', { image_id: id_image, url_image: imgName, product_id: id })
                                        .then(() => {
                                            console.log("insert images success: " + imgName);
                                        })
                                        .catch(error => {
                                            console.log('Insert image error: ' + error.message);
                                        });
                                })
                            })
                            .catch(error => {
                                console.log('Insert product error: ' + error.message);
                            });
                    }
                    // after sucessfully crawl and export product data, run callback to run test() for the next url
                    cb(null, res);
                } catch (err) {
                    console.log(err.message);
                    cb(null, {});
                }
            });
    }
    // Use async.mapLimit to only crawl 2 products at the same time
    async.mapLimit(arr, 2, test, function (err, res) {
        cb(null, res);
    });
}

//-----------INITIAL CRAWL TO GET PRODUCT URL----------------------
nightmare
    .goto('https://hoanghamobile.com/dien-thoai-di-dong-c14.html?brand=4,23,2,10,11,1,3&sort=11')
    .wait(1000)
    .evaluate(function () {
        let res = document.querySelectorAll('.mosaic-overlay');
        let arr = [];
        res.forEach(a => {
            let url = a.href;
            arr.push(url);
        })
        // let newarr = arr.slice(9);
        return arr;
    })
    .end()
    .then(function (result) {
        //console.log(result);
        crawl(result, function (err, res) {
            if (err) console.log(err.message);
            console.log('done!');
        });
    })
    .catch(function (err) {
        console.error('Search failed:', err.message);
    });

