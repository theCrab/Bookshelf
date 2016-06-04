require 'spec_helper'

describe User do
  it 'can be initialised without attributes' do
    user = User.new

    user.must_respond_to(:id)
    user.must_respond_to(:email)
    user.must_respond_to(:password)
    user.must_respond_to(:password_hash)
    user.must_respond_to(:revoked)
    user.must_respond_to(:jti)
    user.must_respond_to(:role)
  end

  it 'can be initialised with attributes' do
    user = User.new(email: 'THE@crab. com', password: 'secret')

    user.id.must_be_nil
    user.email.wont_be_nil
    user.email.must_equal('the@crab.com')
    user.password_hash.wont_be_nil
    user.password.must_be_same_as(user.password_hash)
    user.role.wont_be_nil
    user.role.must_equal('role:admin')
    user.jti.wont_be_nil
    user.jti.length.must_equal(20)
  end
end
