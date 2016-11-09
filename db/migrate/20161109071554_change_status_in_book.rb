class ChangeStatusInBook < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :progress, :integer, :default => 0
  end
end
