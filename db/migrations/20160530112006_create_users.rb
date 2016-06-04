Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :email,         String,   null: false, unique: true, index: true
      column :username,      String
      column :role,          String,   default: 'role:admin'
      column :jti,           String
      column :password_hash, String
      column :revoked,       :boolean, default: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
