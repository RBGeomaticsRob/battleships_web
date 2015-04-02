When(/^I send a hit to "([^"]*)"$/) do |arg1|
  fill_in('coordinate', :with => arg1)
  click_button('submit')
end

When(/^I place ship in "([^"]*)"$/) do |arg1|
  fill_in('location', :with => arg1)
  fill_in('direction', :with => :south)
  click_button('Submit')
end

Given(/^I already have ship in "([^"]*)"$/) do |arg1|
  fill_in('location', :with => arg1)
  fill_in('direction', :with => :south)
  click_button('Submit')
end

Then(/^I should see that a ship has been added to ships total$/) do
  expect(page).to have_content('Ships Placed = 1')
end
