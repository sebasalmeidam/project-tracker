class User < ActiveRecord::Base
  attr_accessor :remember_token

  belongs_to :client
  before_save { self.email = email.downcase }

  has_secure_password

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true,
                 format: { with: VALID_EMAIL_REGEX }
  
  VALID_PASSWORD_REGEX = /.*(?=.{0,})(?![0-9]*$)(?![A-Z]*$)(?!\W*$)((?=.*\d)|(?=.*[A-Z])|(?=.*\W)).*/
	  validates :password, presence: true, length: { minimum: 6, :message => 'Contraseña debe tener al menos 6 caracteres.'},
	      format: { with: VALID_PASSWORD_REGEX, :message => 'Contraseña debe tener al menos 1 número, una mayúscula o un caracter especial.' }, allow_nil: true, allow_blank: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end