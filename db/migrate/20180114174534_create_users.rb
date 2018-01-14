class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :charity_name
      t.string :charity_url
      t.string :donate_amount

      t.timestamps
    end
  end
end
