Feature: OCPI Server supports 2.2.1 version
  Scenario: eMSP checks OCPI 2.2.1 version is supported
    When eMSP checks "version" in CPO system
    And list of versions response is valid and contains values
      | version |             url                           |
      | 2.2.1   | http://localhost:8080/cpo/api/versions/details?version=2.2.1  |