require 'autoinc'

class User
  include Mongoid::Document
  include Mongoid::Autoinc
 
  # devise config (authentication)
  devise :database_authenticatable, :registerable, :token_authenticatable, :validatable

  # model properties
  field :userId,                type: String
  field :firstName,             type: String
  field :lastName,              type: String
  field :authentication_token,	type: String

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def password_required?
    false
  end
end
