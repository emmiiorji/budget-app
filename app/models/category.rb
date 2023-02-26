class Category < ApplicationRecord
  has_and_belongs_to_many :transacts, dependent: :delete
  belongs_to :user
end
