Given(/^I am on the Battleships page$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I should see 'error page'$/) do
  expect(page).to have_content('There\'s been a collision!')
end

Then(/^I should see the table$/) do
  page.should have_xpath("//table[@data-purpose = 'board' and @data-user='player_1']")
end