class CreateBookLibraryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :book_library_relations do |t|
      t.belongs_to :book, index: true
      t.belongs_to :library, index: true
      t.timestamps
    end
  end
end
