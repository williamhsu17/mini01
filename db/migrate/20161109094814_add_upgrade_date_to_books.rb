class AddUpgradeDateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :published_date, :date
    add_column :books, :book_link, :string
  end
end
