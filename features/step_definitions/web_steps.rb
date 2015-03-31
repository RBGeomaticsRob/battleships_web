Given(/^a user is on Battleships page$/) do
  #visit '/'
end

When(/^they send "(.*?)"$/) do |arg1|
  fill_in('Coordinate', :with => arg1)
end

Then(/^they receive a hit$/) do
  visit '/hit'
  page.should have_content("Hello!")
end