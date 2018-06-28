class User < ApplicationRecord

  ## Associations ##
  has_many :memberships,   foreign_key: :member_id,  dependent: :destroy
  has_many :joined_coops,  through:     :memberships 
  
  has_many :managements,   foreign_key: :manager_id, dependent: :destroy
  has_many :managed_coops, through:     :managements

  ## Validations ##
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: {case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  ## Actions ##
  before_save { email.downcase! } 
  attr_accessor :remember_token
  has_secure_password
  
  ## Functions ##
  
  # Returns the hash digest of the given string
  def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
  end

  # Returns a new remember token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistant sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  ## Membership methods ##
  
  # Joins a coop
  def join_coop(coop)
    joined_coops << coop
  end

  # Ends membership with a coop
  def leave_coop(coop)
    joined_coops.delete(coop)
  end

  # Returns true if user has joined the coop
  def joined?(coop)
    joined_coops.include?(coop)
  end

  ## Management methods ##
  
  # Methods for adding/removing managers are in the Coop model

  # Returns true if coop is managed by user
  def managed?(coop)
    managed_coops.include?(coop)
  end

end
