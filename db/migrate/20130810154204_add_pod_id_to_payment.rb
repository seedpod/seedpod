class AddPodIdToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :pod, index: true
  end
end
