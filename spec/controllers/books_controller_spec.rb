require 'rails_helper'

id = Faker::Number.between(from: 1, to: 10)
title = Faker::Book.title
price = Faker::Number.between(from: 200, to: 990)
memo = Faker::Book.genre
book = Book.new(id: id, title: title, price: price, memo: memo)

RSpec.describe BooksController, type: :controller do
  describe "create" do

    it "redirec to home index" do
      get :create, params: {book: {title: title, price: price, memo: memo}}
      expect(response).to redirect_to root_path
    end

    it "create book" do
      expect{
        post :create, 
        params: {book: {title: title, price: price, memo: memo}}
      }.to change(Book, :count).by(1)
    end

    it "title nil false" do
      expect{
        post :create, 
        params: {book: {title: nil, price: price, memo: memo}}
      }.to change(Book, :count).by(0)
    end
    
    it "price nil false" do
      expect{
        post :create, 
        params: {book: {title: title, price: nil, memo: memo}}
      }.to change(Book, :count).by(0)
    end
    
    it "memo nil false" do
      expect{
        post :create, 
        params: {book: {title: title, price: price, memo: nil}}
      }.to change(Book, :count).by(0)
    end

  end

  describe "destroy" do
    
    it "redirec to home index" do
      get :destroy, params: {id: book.id}
      expect(response).to redirect_to root_path
    end

    it "delete book" do
      expect{
        delete :destroy, params: {id: book.id}
      }.to change(Book, :count).by(-1)
    end

  end
end
