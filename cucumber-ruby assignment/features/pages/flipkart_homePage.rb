require 'page-object'
require 'selenium-webdriver'

class FlipkartHomePage
  include PageObject

  text_field(:search_box, name: 'q')
  button(:search_button, xpath: "//button[@type='submit']")

  def search_for(product)
    self.search_box = product
    search_button
  end
end
