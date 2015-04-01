Given(/^I am on the Battleships page$/) do
  visit '/'
end

When(/^I send "([^"]*)"$/) do |arg1|
  fill_in('coordinate', :with => arg1)
end

When(/^I click the submit button$/) do
  click_button('submit')
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I already have ship in A(\d+)$/) do |arg1|
  
end

Then(/^I should see 'error page'$/) do
  
end

Then(/^I receive an error message$/) do
  
end