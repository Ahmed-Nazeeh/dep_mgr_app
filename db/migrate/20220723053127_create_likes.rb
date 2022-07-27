class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.boolean :like, default: false
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
