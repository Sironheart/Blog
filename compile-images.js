const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

const dir = path.join(__dirname, '_site/opengraph/articles');
fs.readdir(dir, function (err, files) {
    if (err) {
        return console.log(err.message);
    }

    files.forEach(function (file) {
        let renderPath = path.join(dir, `/${file}/index.html`)
        const browser = puppeteer.launch({
            defaultViewport: {
                width: 1200,
                height: 630
            },
            headless: true,
            executablePath: '/usr/bin/chromium-browser',
            args: [
                "--no-sandbox",
                "--disable-gpu",
            ]
        }).then((browser) => {
            browser.newPage().then((page) => {
                page.goto(`file://${renderPath}`).then(() => {
                    page.screenshot({type: "webp", path: `${dir}/${file}.webp`}).then(() => {
                        browser.close();
                    })
                })
            })
        });
    })
});
