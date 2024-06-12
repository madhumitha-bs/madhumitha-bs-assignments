require_relative '../pages/flipkart_homePage'

Given(/^I am on the Flipkart homepage/) do
  @home_page = FlipkartHomePage.new(@browser)
  @home_page.navigate_to("https://www.flipkart.com")
end

When(/^I search for "([^"]*)"$/) do |product|
  @home_page.search_for(product)
end

Then(/^I should see search results for "([^"]*)"$/) do |product|
    expect(@browser.page_source).to include(product)
end
