@flipkart_search
Feature: Flipkart Product Search

  Scenario Outline: Search for a product
    Given I am on the Flipkart homepage
    When I search for "<product>"
    Then I should see search results for "<product>"
  
  Examples:
      | product       |
      | laptop        |
      | mobile phone  |
      | headphones    |
      | smart watch   |
      | tablet        |