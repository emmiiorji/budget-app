require 'rails_helper'
RSpec.describe Transact, type: :model do
  it 'Valid if name is present' do
    @user = User.create!(first_name: 'Emmanuel', last_name: 'Orji', email: 'emmanuelorji2013@gmail.com',
                         password: 1_234_567)
    @transact = Transact.create(name: 'goods', amount: 200.00, author_id: @user.id)
    expect(@transact).to be_valid
  end

  it 'Invalid if name is absent' do
    @user = User.create!(first_name: 'Emmanuel', last_name: 'Orji', email: 'emmanuelorji2013@gmail.com',
                         password: 1_234_567)
    @transact = Transact.create(amount: 200.00, author_id: @user.id)
    expect(@transact).to be_valid
  end
end
