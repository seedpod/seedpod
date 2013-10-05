class Instruction < ActiveRecord::Base
  belongs_to :crop
  belongs_to :pod
  
  rails_admin do
    configure :detail do
      html_attributes rows: 20, cols: 80
    end
  end
  
  def visible_to?(user)
    ship == true || crop.shipped_to?(user)
  end
  
end
