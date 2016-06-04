require 'bcrypt'

class User
  include Hanami::Entity

  attributes :email, :password, :password_hash, :revoked, :role, :jti, :updated_at, :created_at

  def initialize(params={})
    params = params.to_h ## Had to hack around this one :/
    params[:jti]  ||= ([*('a'..'z'), *('A'..'Z'), *(0..9)].shuffle[0,20].join)
    params[:role] ||= 'role:admin'
    super(params)
  end

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
