json.extract! order, :id, :order_number, :title, :description, :recieved, :recieved_by, :approved, :approved_by, :closed, :closed_by, :remarks, :status, :actions, :created_at, :updated_at
json.url order_url(order, format: :json)
