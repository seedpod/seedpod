Given(/^I have requested a password reset$/) do
  @token = @user.send_reset_password_instructions
end

When(/^I visit the password reset page$/) do
  visit edit_user_password_path(@user, :reset_password_token => @token)
end

When(/^I enter a new password$/) do
  @newpass = 'myAwes0menewP@ssword'
  fill_in 'user[password]', with: @newpass
  fill_in 'user[password_confirmation]', with: @newpass
  click_button 'Change my password'
end

Then(/^my password should be changed$/) do
  page.should_not have_text 'error'
  @user.reload
  @user.valid_password?(@newpass).should be_true
end