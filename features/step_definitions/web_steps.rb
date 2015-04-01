Given(/^I am on the Battleships page$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I already have ship in "([^"]*)"$/) do |arg1|
  fill_in('location', :with => arg1)
  fill_in('direction', :with => :south)
  click_button('Submit')
end

Then(/^I should see 'error page'$/) do
  expect(page).to have_content('There\'s been a collision!')
end

When(/^I send a hit to "([^"]*)"$/) do |arg1|
  fill_in('coordinate', :with => arg1)
  click_button('submit')
end

When(/^I place ship in "([^"]*)"$/) do |arg1|
  fill_in('location', :with => arg1)
  fill_in('direction', :with => :south)
  click_button('Submit')
end