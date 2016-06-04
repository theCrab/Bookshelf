class UserRepository
  include Hanami::Repository

  def find_by_email(email)
    query { where(email: email) }.first
  end
end
