Feature: CPO Server returns credentials

  Scenario: Already registered client can not be registered one more time
    Given eMSP is registered in CPO system
    When eMSP post "credentials" in CPO system with data
    |any|
    Then eMSP responded with HTTP status 405