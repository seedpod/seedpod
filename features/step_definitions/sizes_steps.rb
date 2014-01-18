Given(/^the current pod has a crop "(.*?)" which is organic$/) do |name|
  crop = FactoryGirl.create(:crop, name: name, organic: true, non_organic: false)
  FactoryGirl.create(:instruction, crop: crop, pod: @current_pod, ship: true)
end

Given(/^the current pod has a crop "(.*?)" which is "(.*?)" "(.*?)"$/) do |name, size, is_organic|
  crop_options = {
    name: name
  }
  case is_organic
    when "organic"
      crop_options[:organic] = true
      crop_options[:non_organic] = false
    when "organic and non-organic"
      crop_options[:organic] = true
      crop_options[:non_organic] = true
    else
      crop_options[:organic] = false
      crop_options[:non_organic] = true
  end
  case size
    when "balcony"
      crop_options[:small] = true
    when "garden"
      crop_options[:medium] = true
    when "allotment"
      crop_options[:large] = true
  end
  @crop = FactoryGirl.create(:crop, crop_options)
  FactoryGirl.create(:instruction, crop: @crop, pod: @current_pod, ship: true)
end

Given(/^that crop is also "(.*?)" "(.*?)"$/) do |size, is_organic|
  crop_options = {}
  case is_organic
    when "organic"
      crop_options[:organic] = true
      crop_options[:non_organic] = false
    when "organic and non-organic"
      crop_options[:organic] = true
      crop_options[:non_organic] = true
    else
      crop_options[:organic] = false
      crop_options[:non_organic] = true
  end
  case size
    when "balcony"
      crop_options[:small] = true
    when "garden"
      crop_options[:medium] = true
    when "allotment"
      crop_options[:large] = true
  end
  @crop.update_attributes!(crop_options)
end

Then(/^I should be charged the "(.*?)" "(.*?)" amount$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^my subscription should be marked as "(.*?)" "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^the subscription is "(.*?)" "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^they should be listed as receiving "(.*?)" "(.*?)" seeds$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^the gift code should be marked as "(.*?)" "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^a "(.*?)" "(.*?)" gift code has been bought for me$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^an "(.*?)" "(.*?)" gift code has been bought for me$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end