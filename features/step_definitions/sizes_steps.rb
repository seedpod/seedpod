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
    when "small"
      crop_options[:small] = true
    when "medium"
      crop_options[:medium] = true
    when "large"
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
    when "small"
      crop_options[:small] = true
    when "medium"
      crop_options[:medium] = true
    when "large"
      crop_options[:large] = true
  end
  @crop.update_attributes!(crop_options)
end

Then(/^I should be charged "(.*?)" by GoCardless$/) do |arg1|
  page.current_url.should include("subscription%5Bamount%5D=#{arg1}")
end

Then(/^my subscription should be marked as "(.*?)" "(.*?)"$/) do |is_size, is_organic|
  @subscription ||= User.last.subscriptions.last
  @subscription.organic.should == (is_organic == "organic")
  @subscription.size.should == is_size
end

Given(/^the subscription is "(.*?)" "(.*?)"$/) do |is_size, is_organic|
  @subscription.organic = (is_organic == "organic")
  @subscription.size = is_size  
  @subscription.save
end

Then(/^they should be listed as receiving "(.*?)" seeds$/) do |is_size|
  page.should have_text(is_size)
end

When(/^the gift code should be marked as "(.*?)"$/) do |is_size|
  GiftCode.count.should == 1
  GiftCode.last.size.should == is_size
end

Given(/^that gift code is "(.*?)"$/) do |is_size|
  @gift_code.size = is_size
  @gift_code.save
end