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
# ------------------------------------------
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

# def get_last_ten_records
#   Order.limit(10).order('id desc').reverse
# end

# ---------------------------------------------
  
  def self.to_csv
    # attr_reader :order_nmber, :title, :description
    attributes = %w{order_number title description recieved recieved_by approved approved_by closed closed_by remarks status actions issued_by}
   
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end
  
  # def self.to_csv
  #   attr_accessor :order_nmber, :title, :description
  #   CSV.generate do |csv|
  #     csv << column_names
  #     all.each do |product|
  #       csv << product.attributes.values_at(*column_names)
  #     end
  #   end
  # end

end
