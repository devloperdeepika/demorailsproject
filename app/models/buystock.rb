class Buystock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  # validates_uniqueness_of :stock_id 

end

