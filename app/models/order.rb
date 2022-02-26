class Order < ApplicationRecord

belongs_to :user
    
def self.search(param)
    param.strip!
    to_send_back = (order_number_matches(param) + title_matches(param) + description_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end
  
  def self.order_number_matches(param)
    matches('order_number', param)
  end
  
  def self.title_matches(param)
    matches('title', param)
  end
  
  def self.description_matches(param)
    matches('description', param)
  end
  
  def self.matches(field_name, param)   #self so that convert it to class method not write User
    where("#{field_name} like ?", "%#{param}%")
  end
  
  
  
  
  def get_pendding_orders
    orders = Order.all 
    orders_arr = []
      orders.each do |order|
        if order.status == "pendding Approvals"
        orders_arr << order 
        end
      end
      return orders_arr
  end

  



end
