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
  page.should have_xpath("//table[@data-purpose='board' and @data-user='player_1']")
end

Then(/^the grid should have (\d+) rows$/) do |arg1|
  expect(page.all("//table[@data-purpose='board'][@data-user='player_1']/tr").count).to eq arg1.to_i
end

Then(/^the grid should have (\d+) columns$/) do |arg1|
  page.all("//table[@data-purpose='board'][@data-user='player_1']/tr").each_with_index do |el, index| 
    expect(page.all("//table[@data-purpose='board'][@data-user='player_1']/tr[@data-row='#{index+1}']/td").count).to eq arg1.to_i
  end
end