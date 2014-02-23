Given(/^there is a crop called "(.*?)"$/) do |crop_name|
  FactoryGirl.create :crop, name: crop_name, medium: true
end

Given(/^the current pod has instructions and shipping for "(.*?)"$/) do |crop_name|
  crop = Crop.where(name: crop_name).first
  FactoryGirl.create :instruction, crop: crop, ship: true, pod: @current_pod
end

Given(/^the current pod has instructions for "(.*?)"$/) do |crop_name|
  crop = Crop.where(name: crop_name).first
  FactoryGirl.create :instruction, crop: crop, pod: @current_pod
end

Given(/^the previous pod has instructions and shipping for "(.*?)"$/) do |crop_name|
  crop = Crop.where(name: crop_name).first
  FactoryGirl.create :instruction, crop: crop, ship: true, pod: @previous_pod
end

Then(/^I should see instructions for "(.*?)"$/) do |crop_name|
  page.should have_text(crop_name)
end

Then(/^I should not see instructions for "(.*?)"$/) do |crop_name|
  page.should_not have_text(crop_name)
end