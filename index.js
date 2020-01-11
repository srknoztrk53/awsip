const fetch = require("node-fetch");
const url = "https://www.google.com";

const winston = require('winston');
require('winston-daily-rotate-file');

const transport = new(winston.transports.DailyRotateFile)({
    filename: './logs/application-%DATE%.log',
    datePattern: 'YYYY-MM-DD',
    zippedArchive: true,
    maxSize: '20m',
    maxFiles: '14d'
});

transport.on('rotate', function (oldFilename, newFilename) {
    // do something fun
});

const logger = winston.createLogger({
    transports: [
        transport
    ]
});


const request = async url => {
    try {
        const response = await fetch(url);
        logger.info(response);
    } catch (error) {
        logger.info(error);
    }
};


const INSTANCE = request('http://169.254.169.254/latest/meta-data/instance-id');
const OLD_IP = request('http://169.254.169.254/latest/meta-data/public-ipv4');

