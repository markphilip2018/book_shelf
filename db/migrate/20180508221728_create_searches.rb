class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :isbn
      t.string :author
      t.string :name
      t.integer :publication_year
      t.string :category

      t.timestamps
    end
  end
end
