class Category < ApplicationRecord
  has_many :transacts
  belongs_to :user
end
