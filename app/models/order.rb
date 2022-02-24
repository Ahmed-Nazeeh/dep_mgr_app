class Order < ApplicationRecord

belongs_to :user
    

def get_order_id
    order = Order.where(id: 1)

    if order.exists?
      order_id = Order.last.id + 1
    else
      order_id = 1
    end
    year_day = Date.today.yday
    year = Date.today.year
    "WO-#{year_day}-#{order_id}-#{year}"
  end
  
def get_last_ten_records
    Order.limit(10).order('id desc').reverse
  end


end
