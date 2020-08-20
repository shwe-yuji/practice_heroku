require 'rails_helper'

RSpec.feature "Books", type: :feature do

  let(:book) {create(:book)}
  scenario 'post and delete book' do
    visit root_path #サイトに到着

    #3項目入力
    fill_in 'book_title', with: book.title
    fill_in 'book_price', with: book.price
    fill_in 'book_memo', with: book.memo

    #submitボタンクリック後、データを保存
    expect {
      click_on('SUBMIT')
    }.to change(Book, :count).by(1)

    #root_pathに移り、保存されているデータが表示されているか
    visit root_path
    expect(page).to have_selector('.book-list__info')

    # 削除ボタンをクリック
    expect {
      click_on(book.id)
    }.to change(Book, :count).by(-1)
    visit root_path

  end
end
