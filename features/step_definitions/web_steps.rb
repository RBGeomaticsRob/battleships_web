Given(/^I am on the Battleships page$/) do
  visit '/'
end

Given(/^I am on the Play page$/) do
  visit '/play'
end

Then(/^I should see 'error page'$/) do
  expect(page).to have_content('Woops!')
end

Then(/^I should see the table$/) do
  page.should have_xpath("//table[@data-purpose='board' and @data-user='player_1']")
end

Then(/^the grid should have (\d+) rows$/) do |rows|
  rows = rows.to_i + 2
  expect(page.all("//table[@data-purpose='board'][@data-user='player_1']/tr").count).to eq rows
end

Then(/^the grid should have (\d+) columns$/) do |columns|
  page.all("//table[@data-purpose='board'][@data-user='player_1']/tr[@data-row]").each_with_index do |el, index|
    expect(page.all("//table[@data-purpose='board'][@data-user='player_1']/tr[@data-row='#{index+1}']/td[@data-column]").count).to eq columns.to_i
  end
end

Then(/^I want to see a "([^"]*)" in grid square "([^"]*)"$/) do |mark, grid_square|
  a1_mark = page.all("//table/tr[@data-row='#{grid_square[1]}']/td[@data-column='#{grid_square[0]}']").map(&:text)
  expect(a1_mark).to include mark
end