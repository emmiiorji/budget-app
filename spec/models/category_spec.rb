require 'rails_helper'
RSpec.describe Category, type: :model do
  it 'valid if name is present' do
    @user = User.create(first_name: 'Emmanuel', last_name: 'Orji', email: 'emmanuelorji2013@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Groceries', icon: 'www.render.com', user_id: @user.id)
    expect(@category).to be_valid
  end

  it 'Must be associated with a user' do
    @category = Category.create(name: 'Groceries', icon: 'www.render.com')
    expect(@category).to_not be_valid
  end

  it 'valid if User present' do
    @user = User.create(first_name: 'Emmanuel', last_name: 'Orji', email: 'emmanuelorji2013@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Groceries', icon: 'www.render.com', user_id: @user.id)
    expect(@category).to be_valid
  end

  it 'Must have an icon' do
    @user = User.create(first_name: 'Emmanuel', last_name: 'Orji', email: 'emmanuelorji2013@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Groceries', icon: 'www.render.com', user_id: @user.id)
    expect(@category).to be_valid
  end
end
