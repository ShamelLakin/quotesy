class Category < ApplicationRecord
    has_many :quotes, dependent: :destroy
end
