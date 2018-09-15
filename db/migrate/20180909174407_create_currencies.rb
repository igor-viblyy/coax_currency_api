class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :from
      t.string :to
      t.references :user, index: true

      t.timestamps
    end
  end
end
