class Coop < ApplicationRecord
  
  ## Associations ##
  has_many :memberships, foreign_key: :joined_coop_id,  dependent: :destroy
  has_many :members,  through: :memberships

  has_many :managements, foreign_key: :managed_coop_id, dependent: :destroy
  has_many :managers, through: :managements

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

  ## Management Methods ##
  
  def add_manager(user)
    managers << user
  end
  
  # Removes a user from management
  def remove_manager(user)
    managers.delete(user)
  end
  
  # Returns true if the user is a manager
  def manager?(user)
    managers.include?(user)
  end

end
