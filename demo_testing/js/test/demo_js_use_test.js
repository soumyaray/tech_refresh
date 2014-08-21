var assert = require('assert'),
    test = require('selenium-webdriver/testing'),
    webdriver = require('selenium-webdriver');

test.describe('Google Search', function() {
  test.it('should work', function() {
    var driver = new webdriver.Builder().
    withCapabilities(webdriver.Capabilities.chrome()).
    build();

    driver.get('http://bit.ly/watir-webdriver-demo');

    driver.findElement(webdriver.By.id('entry_0')).sendKeys('Your Name');
    driver.findElement(webdriver.By.name('submit')).click();

    driver.wait(function() {
      return driver.getPageSource().then(function(text) {
        var found = text.match('Thank you');
        assert.equal(found[0], 'Thank you');
        return true;
      });
    }, 3000);

    driver.quit();
  });
});
