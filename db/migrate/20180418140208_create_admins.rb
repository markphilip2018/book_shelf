class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.belongs_to :library, foreign_key: true
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
