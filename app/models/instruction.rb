class Instruction < ActiveRecord::Base
  belongs_to :crop
  belongs_to :pod
end
