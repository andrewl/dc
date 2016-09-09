Feature: Test hiding special features
  In order to provide an incentive to register
  As the sales manager
  I want to prevent special articles from being viewed by anonymous users

Scenario: Anonymous users should not be able to see Special Articles
	Given I am an anonymous user
	When I go to "/"
	Then I should not see "Exclusive for registered users"

Scenario: Registered users should not be able to see Special Articles
	Given I am an anonymous user
	When I go to "/"
	And I enter "ronald" for "Username"
	And I enter "password" for "Password"
	And I press "Log in"
	Then I should see "Exclusive for registered users"

