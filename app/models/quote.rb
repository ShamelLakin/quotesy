class Quote < ApplicationRecord
  belongs_to :category
  validates :quote, :author, :category, presence: true
end
