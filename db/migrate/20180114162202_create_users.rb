class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :charity_name
      t.string :charity_url
      t.string :donate_amount
      t.references :lectures, foreign_key: true
      t.references :events, foreign_key: true

      t.timestamps
    end
  end
end