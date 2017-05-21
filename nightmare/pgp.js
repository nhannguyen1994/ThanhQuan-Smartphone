/**
 * Created by techmaster on 1/17/17.
 */
const path = require("path");
const env = process.env.NODE_ENV || "development";
const config = require(path.join(__dirname, 'config', 'config.json'))[env];
// const Promise = require('bluebird');
// const monitor = require("pg-monitor");

const cn = {
  host: config.host,
  port: config.port,
  database: config.database,
  user: config.username,
  password: config.password
};

const pgp = require('pg-promise')();
// Khi có lỗi phải bật monitor để quan sát câu lệnh SQL
//monitor.attach(options);
//monitor.setTheme('bright');

module.exports.db = pgp(cn);
module.exports.config = config;