
var webdriver = require('selenium-webdriver'),
    SeleniumServer = require('selenium-webdriver/remote').SeleniumServer;

var server = new SeleniumServer('/Users/amadeus/Documents/WebDriverJS/testing/selenium-server-standalone-2.42.2.jar', {
  port: 4444
});

server.start();


var driver = new webdriver.Builder().
    usingServer(server.address()).
    withCapabilities({
      'browserName': 'chrome',
      'version': '',
      'platform': 'ANY',
      'javascriptEnabled': true
    }).
    build();


driver.get('http://www.google.com');
driver.findElement(webdriver.By.name('q')).sendKeys('webdriver\n');

//driver.findElement(webdriver.By.name('btnK')).click();
driver.getTitle().then(function(title) {
  require('assert').equal('webdriver - Google 搜尋', title);

});

// driver.wait(function() {
//  return driver.getTitle().then(function(title) {
//    return title === 'webdriver - Google 搜尋';
//  });
// }, 2000);

driver.quit();