class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.date :date
      t.string :file_name

      t.timestamps
    end
  end
end
