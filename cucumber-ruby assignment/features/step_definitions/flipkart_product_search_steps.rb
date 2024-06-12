require_relative '../pages/flipkart_homePage'
require_relative '../pages/flipkart_searchResults'

Given(/^I am on the Flipkart homepage/) do
  @home_page = FlipkartHomePage.new(@browser)
  @home_page.navigate_to($page_url)
end

When(/^I search for "([^"]*)"$/) do |product|
  @home_page.search_for(product)
end

Then(/^I should see search results for "([^"]*)"$/) do |product|
  @searchResult = SearchResultsPage.new(@browser)
  expect(@searchResult.getShowingResutsText).to include(product)
end
