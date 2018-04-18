class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :library, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.integer :ISBN
      t.integer :publication_year
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
