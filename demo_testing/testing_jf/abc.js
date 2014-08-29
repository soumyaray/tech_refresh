var assert = require('assert'),
    test = require('selenium-webdriver/testing');

var webdriver = require('selenium-webdriver');
   SeleniumServer = require('selenium-webdriver/remote').SeleniumServer;

var server = new SeleniumServer('/Users/amadeus/Documents/WebDriverJS/testing/selenium-server-standalone-2.42.2.jar', {
  port: 4444
});


server.start();


test.describe('Google Search', function() {

var driver = new webdriver.Builder().
    usingServer(server.address()).
    withCapabilities(webdriver.Capabilities.chrome()).
    build();

	test.it('should work', function(done) {
		driver.get('http://www.google.com');
		driver.findElement(webdriver.By.name('q')).sendKeys('webdriver');
		driver.findElement(webdriver.By.name('btnK')).click();
		driver.getTitle().then(function(title) {
		  require('assert').equal('webdriver - Google Search', title);

		});
		driver.quit();
  });
});