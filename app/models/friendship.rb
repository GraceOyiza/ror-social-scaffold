class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true

  def confirm_friend
    self.update_attributes(confirmed: true)
    Friendship.create!(friend_id: self.user_id,
                    user_id: self.friend_id,
                    confirmed: true)
  end

end
