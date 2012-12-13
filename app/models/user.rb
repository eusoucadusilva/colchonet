class User < ActiveRecord::Base

  has_many :rooms
  #attributes and acessors
  attr_accessible :bio, :email, :full_name, :location,
  				  :password, :password_confirmation


  #validates
  validates_presence_of 	:full_name, :email, :location #,:password
  #validates_confirmation_of :password
  validates_length_of		:bio, :minimum => 30, :allow_blank => false
  validates_format_of 		:email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of	:email

  has_secure_password

  #scopes
  scope :confirmed, where('confirmed_at IS NOT NULL')

  #callbacks
  before_create :generate_token


  #functions
  def generate_token
  	self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirmed?
    confirmed_at.present?
  end

  def confirm!
  	return if confirmed?

  	self.confirmed_at = Time.current
  	self.confirmation_token = ''
  	save!
  end

  def self.authenticate(email,password)
    confirmed.
    find_by_email(email).
    try(:authenticate, password)
  end
end
