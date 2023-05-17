class History < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.log(event_type, post)
    create(event_type: event_type, post_id: post.id, user_id: post.user_id)
  end
end
