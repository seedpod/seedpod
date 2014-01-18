Feature: Admin login
  In order to look after the site
  I want to be able to log in as an administrator

Scenario: Administration site is not accessible without signing in as an admin
  When I visit the administration area
  Then I should be denied access