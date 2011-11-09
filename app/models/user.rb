class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :token_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # fields
  field :username
  field :email
  
  attr_accessor :login
  
  # callbacks
  before_create :create_login
  before_create :ensure_authentication_token
  
  # relations
  has_many :vines
  has_many :photos
  
  protected
  def create_login
    if self.username.empty?
      email = self.email.split(/@/)
      login_taken = User.where(:username => email[0]).first
      self.username = email[0] unless login_taken
    end
  end

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :username => login }, { :email => login }).first
  end
end
