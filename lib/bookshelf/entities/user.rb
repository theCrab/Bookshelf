require 'bcrypt'

class User
  include Hanami::Entity
  attributes :email, :password, :password_hash, :revoked, :updated_at, :created_at

  def password=(str)
    @password = str
    self.password_hash = BCrypt::Password.create(str)
  end

  def password
    self.password_hash
  end

  def email=(str)
    @email ||= str.strip.downcase.gsub(/\s+/, '')
  end
end
