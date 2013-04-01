class Pod < ActiveRecord::Base
  has_many :instructions
  
  def self.find_by_date(date)
    Pod.where(month: Date.strptime(date, "%Y-%m")).first
  end
  
end
