class Coop < ApplicationRecord
  has_many :memberships, foreign_key: :joined_coop_id,
                         dependent:   :destroy
  has_many :members, through: :memberships

  validates :name,        presence: true, length: { maximum: 50 }
  validates :description, presence: true

  ## Membership Methods ##

  # Make a user a member
  def add_member(user)
    members << user
  end

  # Remove a user from membership
  def remove_member(user)
    members.delete(user)
  end

  # Returns true if the user is a member
  def member?(user)
    members.include?(user)
  end

end
