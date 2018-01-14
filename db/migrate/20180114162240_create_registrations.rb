class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :user_name
      t.string :full_name
      t.binary :file_upload

      t.timestamps
    end
  end
end
