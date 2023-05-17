class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 2 }
  validates :author, length: { minimum: 2 }
  validates :body, length: { minimum: 2, maximum: 999 }
end
