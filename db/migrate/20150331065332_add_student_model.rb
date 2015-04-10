class AddStudentModel < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :gender

      t.string :password_digest

      t.timestamps null: false
    end
  end
end
