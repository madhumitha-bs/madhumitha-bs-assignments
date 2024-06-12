require 'page-object'
require 'selenium-webdriver'

class SearchResultsPage
  include PageObject

  def getShowingResutsText()
    span_text = @browser.find_element(:xpath, "//span[contains(text(),'Showing')]").text
    return span_text
  end
end
