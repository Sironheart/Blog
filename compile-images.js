const puppeteer = require('puppeteer-core');
const path = require('path');
const fs = require('fs');

const dir = path.join(__dirname, '_site/opengraph/articles');
fs.readdir(dir, { withFileTypes: true }, function (err, files) {
    if (err) {
        return console.log(err.message);
    }

    files.filter(dirent => dirent.isDirectory()).map(dirent => dirent.name).forEach(function (file) {
        let renderPath = `${file}/`;
        puppeteer.launch({
            executablePath: '/usr/bin/chromium-browser',
            defaultViewport: {
                width: 1200,
                height: 630
            },
            args: [
                "--no-sandbox",
            ]
        }).then((browser) => {
            browser.newPage().then((page) => {
                page.goto(`http://127.0.0.1/opengraph/articles/${renderPath}`, {
                    timeout: 8500
                }).then(() => {
                    page.screenshot({type: "webp", path: `${dir}/${file}.webp`}).then(() => {
                        browser.close();
                    })
                })
            })
        });
    })
});
