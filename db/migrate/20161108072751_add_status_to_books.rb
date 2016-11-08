class AddStatusToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string
    add_column :books, :Category, :string
  end
end
