Feature: Flipkart Product Search

  Scenario Outline: Search for a product
    Given User is on the Flipkart homepage
    When User search for "<product>"
    Then User should see search results for "<product>"
  
  Examples:
      | product       |
      | laptop        |
      | mobile phone  |
      | headphones    |
      | smart watch   |
      | tablet        |