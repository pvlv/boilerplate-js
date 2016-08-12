'use strict';

const nconf = require('nconf');

const config = nconf
                .argv()
                .env()
                .file({ file: './config/config.json' });

module.exports = config;
