Given(/^the current pod has a crop "(.*?)" which is organic$/) do |name|
  crop = FactoryGirl.create(:crop, name: name, organic: true, non_organic: false)
  FactoryGirl.create(:instruction, crop: crop, pod: @current_pod, ship: true)
end

Given(/^the current pod has a crop "(.*?)" which is non\-organic$/) do |name|
  crop = FactoryGirl.create(:crop, name: name, organic: false, non_organic: true)
  FactoryGirl.create(:instruction, crop: crop, pod: @current_pod, ship: true)
end

Given(/^the current pod has a crop "(.*?)" which is organic and non\-organic$/) do |name|
  crop = FactoryGirl.create(:crop, name: name, organic: true, non_organic: true)
  FactoryGirl.create(:instruction, crop: crop, pod: @current_pod, ship: true)
end
