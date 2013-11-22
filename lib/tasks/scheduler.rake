desc "deliver gift codes to recipients"
task :deliver_gift_codes => :environment do
  GiftCode.deliver_emails!
end