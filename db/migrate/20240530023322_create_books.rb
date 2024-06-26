class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publushed_on
      t.boolean :showing
      t.integer :price

      t.integer :status, default: 1
      

      t.timestamps
    end
  end
end
