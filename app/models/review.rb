class Review < ApplicationRecord
  belongs_to :list
  validates :username, presence: true
  validates :content, presence: true
end
