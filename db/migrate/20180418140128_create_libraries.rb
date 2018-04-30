class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :phone, null: false
      t.timestamps
    end
  end
end
