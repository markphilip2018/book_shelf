class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :category, foreign_key: true
      t.integer :ISBN, null: false
      t.integer :publication_year, null: false
      t.string :name, null: false
      t.string :author, null: false

      t.timestamps
    end
  end
end
