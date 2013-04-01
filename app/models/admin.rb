class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable
end
