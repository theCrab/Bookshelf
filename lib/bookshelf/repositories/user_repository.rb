class UserRepository
  include Hanami::Repository

  def self.find_by_email(email)
    query { where(email: email) }.first
  end
end
