var assert = require('assert'),
    test = require('selenium-webdriver/testing');

var webdriver = require('selenium-webdriver'),
    SeleniumServer = require('selenium-webdriver/remote').SeleniumServer;

var server = new SeleniumServer('/Users/amadeus/Documents/WebDriverJS/testing/selenium-server-standalone-2.42.2.jar', {
  port: 4444
});


server.start();


test.describe('Google Search', function() {
  test.it('should work', function() {

var driver = new webdriver.Builder().
    usingServer(server.address()).
    withCapabilities(webdriver.Capabilities.firefox()).
    build();

driver.get('http://www.google.com');
driver.findElement(webdriver.By.name('q')).sendKeys('webdriver');
driver.findElement(webdriver.By.name('btnK')).click();
driver.wait(function() {
 return driver.getTitle().then(function(title) {
   return title === 'webdriver - Google 搜尋';
 });
}, 2000);

driver.quit();

  });
});