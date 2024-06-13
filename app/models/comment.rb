class Comment < ApplicationRecord
  belongs_to :snapshot
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
