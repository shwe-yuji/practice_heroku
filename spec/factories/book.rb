FactoryBot.define do
    factory :book do
      title {Faker::Book.title}
      price {Faker::Number.between(from: 200, to: 990)}
      memo {Faker::Book.genre}
    end
  end