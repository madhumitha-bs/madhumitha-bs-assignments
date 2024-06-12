require 'selenium-webdriver'

Before do
  bstack_options = {
        "os" => "Windows",
        "osVersion" => "10",
        "browserName" => "Chrome",
        "browserVersion" => "120.0",
        "buildName" => BUILD_NAME,
        "sessionName" => "Ruby thread"
      }
      options = Selenium::WebDriver::Options.send("chrome")
      options.browser_name = bstack_options["browserName"].downcase
      options.add_option('bstack:options', bstack_options)
      @browser = Selenium::WebDriver.for(:remote,
        url: "https://#{USER_NAME}:#{ACCESS_KEY}@hub.browserstack.com/wd/hub",
        capabilities: options)
end

After do
  @browser.quit
end
