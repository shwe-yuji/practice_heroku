require 'rails_helper'
require 'faker'

#バリデーションのテスト
RSpec.describe Book, type: :model do
  it "is valid with title, price, and memo" do
    # title, price, memoの3つがないとテストが通らない
    title = Faker::Book.title
    price = Faker::Number.between(from: 200, to: 990)
    memo = Faker::Book.genre
    book = Book.new(title: title, price: price, memo: memo)
    expect(book).to be_valid
  end
end
