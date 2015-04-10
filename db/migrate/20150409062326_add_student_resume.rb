class AddStudentResume < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :body
      t.timestamps null: false

      t.belongs_to :student, index: true
    end
  end
end
