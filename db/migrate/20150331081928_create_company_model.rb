class CreateCompanyModel < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :desc
      t.string :website
      t.string :address
      t.string :tel
      t.string :email

      t.timestamps null: false
    end

    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :company, index: true
      t.timestamps null: false
    end
  end
end
