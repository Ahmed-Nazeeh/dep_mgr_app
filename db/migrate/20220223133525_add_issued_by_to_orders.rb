class AddIssuedByToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :issued_by, :string
  end
end
