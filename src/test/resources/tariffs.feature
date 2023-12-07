Feature: eMSP gets all tariffs, filtered by last updated between the date_from and date_to (paginated)

  Scenario: CPO Server returns tariffs
    Given eMSP is registered in CPO system
    And CPO has "tariffs" data "db/tariffs.json"
    When eMSP with "party_id" "BEC" and "country_code" "DE" gets "tariff"s
    Then list of tariffs response is valid and is

  Scenario: eMSP retrieves tariffs in CPO system
    Given eMSP is registered in CPO system
    And CPO has "tariffs" data "db/tariffs.json"
    When "date_from" query param is "2022-01-01T07:15:10"
    And "date_to" query param is "2025-10-24T07:15:10"
    And "limit" query param is "3"
    And "offset" path param is "10"
    And eMSP with "party_id" "BEC" and "country_code" "DE" gets "tariff"s
    Then list of tariffs response is valid and is

  Scenario: CPO Server returns tariffs after date
    Given eMSP is registered in CPO system
    And CPO has "tariffs" data "db/tariffs.json"
    When "date_to" query param is "2025-10-24T07:15:10"
    And eMSP with "party_id" "BEC" and "country_code" "DE" gets "tariff"s
    Then list of tariffs response is valid and is

  Scenario: CPO Server returns tariffs before date
    Given eMSP is registered in CPO system
    And CPO has "tariffs" data "db/tariffs.json"
    When "date_from" query param is "2022-01-01T07:15:10"
    And eMSP with "party_id" "BEC" and "country_code" "DE" gets "tariff"s
    Then list of tariffs response is valid and is

  Scenario: CPO Server returns n tariffs starting from any position
    Given eMSP is registered in CPO system
    And CPO has "tariffs" data "db/tariffs.json"
    When "limit" query param is "3"
    And "offset" path param is "10"
    And eMSP with "party_id" "BEC" and "country_code" "DE" gets "tariff"s
    Then list of tariffs response is valid and is