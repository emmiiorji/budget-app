class Transact < ApplicationRecord
  has_and_belongs_to_many :categories, dependent: :delete

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
