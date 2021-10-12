class Friendship < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :friend, class_name: "User", foreign_key: "friend_id", required: false
end
