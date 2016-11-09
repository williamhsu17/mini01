class Book < ApplicationRecord
  validates :name, :presence => true

  validates :description, :presence => true
  validates :description, :length => { minimum: 100 }

  validates :progress, :numericality => { only_integer: true, less_than_or_equal_to: 100 }
end
