class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.text :description_short
      t.integer :progress
      t.text :source
      t.string :recommender

      t.timestamps
    end
  end
end
