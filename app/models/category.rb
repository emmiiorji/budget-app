class Category < ApplicationRecord
  has_and_belongs_to_many :transacts
  # has_many :transacts
  belongs_to :user
end
