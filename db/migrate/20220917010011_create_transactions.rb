class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :date
      t.float :amount
      t.text :description
      t.string :request
      t.references :gl_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
