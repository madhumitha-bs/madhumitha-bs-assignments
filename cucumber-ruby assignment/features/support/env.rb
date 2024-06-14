require 'selenium-webdriver'
require 'selenium-webdriver'
require 'cucumber'
require 'rspec'

USER_NAME = ENV['BROWSERSTACK_USERNAME']
ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY']
BUILD_NAME = ENV['BROWSERSTACK_BUILD_NAME']

$page_url = 'https://www.flipkart.com'