class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :title
      t.text :description
      t.string :recieved
      t.string :recieved_by
      t.string :approved
      t.string :approved_by
      t.string :closed
      t.string :closed_by
      t.text :remarks
      t.string :status
      t.string :actions

      t.timestamps
    end
  end
end
