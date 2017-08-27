class Money < ApplicationRecord
  validates :price, presence: true
end
