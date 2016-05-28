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
