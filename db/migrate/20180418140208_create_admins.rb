class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.belongs_to :library, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
