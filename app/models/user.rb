require 'rolify'
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  rolify

  has_and_belongs_to_many :events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutabl  e and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :rememberable, :validatable, :authentication_keys => [:email]
  
  ## Token Authenticatable
  acts_as_token_authenticatable
  field :authentication_token

  ## Database authenticatable
  field :name             
  #validates_presence_of       :name
  field :email,               type:   String,   default: ""
  validates_uniqueness_of     :email, :case_sensitive => false
  field :encrypted_password,  type:   String,   default: ""
  field :gender,              type:   String
  field :total_payment,       type:   Integer,  default: 0
  
  ## Recoverable
  #field :reset_password_token,   type: String
  #field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

end