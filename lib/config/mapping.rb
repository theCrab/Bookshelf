# collection :users do
#   entity     User
#   repository UserRepository
#
#   attribute :id,   Integer
#   attribute :name, String
# end

collection :books do
  entity     Book
  repository BookRepository

  attribute :id,      Integer
  attribute :title,   String
  attribute :author,  String

  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end

collection :users do
  entity     User
  repository UserRepository

  attribute :id,             Integer
  attribute :email,          String
  attribute :revoked,        Boolean
  attribute :username,       String
  attribute :jti,            String
  attribute :role,           String
  attribute :password_hash,  String

  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end
