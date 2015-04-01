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