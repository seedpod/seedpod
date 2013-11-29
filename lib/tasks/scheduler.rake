desc "deliver gift codes to recipients"
task :deliver_gift_codes => :environment do
  GiftCode.deliver_emails!
end

desc "generate shipments for gift codes"
task :generate_shipments_for_gift_codes => :environment do
  GiftCode.generate_shipments!
end