var webdriver = require('selenium-webdriver');

var driver = new webdriver.Builder().
   withCapabilities(webdriver.Capabilities.chrome()).
   build();

driver.get('http://www.google.com');
driver.findElement(webdriver.By.name('q')).sendKeys('webdriver');
driver.findElement(webdriver.By.name('btnK')).click();
driver.wait(function() {
 return driver.getTitle().then(function(title) {
   process.stdout.write("title: " + title);
   return title.match('webdriver - Google');
 });
}, 5000);

driver.quit();
