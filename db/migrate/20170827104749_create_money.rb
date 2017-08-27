class CreateMoney < ActiveRecord::Migration[5.1]
  def change
    create_table :money do |t|
      t.integer :user_id
      t.integer :price, null: false, default: 0
      t.datetime :saved_at, null: false
      t.timestamps
    end
  end
end
