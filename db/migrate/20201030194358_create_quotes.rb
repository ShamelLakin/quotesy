class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :quote
      t.string :author
      t.string :tag
      t.integer :category_id

      t.timestamps
    end
  end
end
