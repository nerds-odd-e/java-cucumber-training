Feature: The Gilded Rose has inventory

  Scenario: I can see the inventory page
    Given There is an inventory page
    When  I load the page
    Then  I can see the welcome message is "Welcome to Kahjeet's inventory!"

  Scenario: All Items have a SellIn date that shows when the item should be sold by
    Given There are items in the catalog
    When  I look at the item summary
    Then  I see the names of two items

  Scenario: The session is persistent enough
    Given There is an inventory page
    And I add an item "persistent cheese"
    When I look at the item summary
    Then I can see the item "persistent cheese"

  @now
  Scenario: All Items have values
      Given There are items in the catalog
      When  I look at the item summary
      Then I see that all the items have a quality value assigned to them
      And I see that all elements have the remaining number of days in which they should be sold

  Scenario Outline: When a day passes items degrade
      Given There is an item "<item>" in the catalog with value <initial_value> and sell by <initial_sell_by>
      When it's the day <days_passed>
      Then then "<item>" has appropriately decreased to <sell_by> days remaining to sell and $<value>
    Examples:
      | item    |initial_sell_by| initial_value| days_passed |sell_by  | value |
      | brie    | 10            | 4.99         | 1           | 9       | 3.99  |
      #| brie    | 10            | 4.99         | 2           | 8       | 2.99  |
